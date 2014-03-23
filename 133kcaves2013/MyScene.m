//
//  MyScene.m
//  133kcaves2013
//
//  Created by Jason McCarrell on 2013-11-13.
//  Copyright (c) 2013 Jason McCarrell. All rights reserved.
//

#import "MyScene.h"

@interface MyScene () <SKPhysicsContactDelegate>

@property (nonatomic) CGFloat maxVel;
@property (nonatomic) SKSpriteNode * player;
@property (nonatomic) SKEmitterNode * jetEffect;
@property (nonatomic) FlatLevelGenerator* level;

//TODO: put this somewhere else
@property (nonatomic) bool lifting;
@property (nonatomic) CGPoint touchOrigin;

@end
@implementation MyScene

-(id)initWithSize:(CGSize)size {    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        self.speedMult = 1.0;
        
        self.backgroundColor = [SKColor purpleColor];
        
        self.player = [SKSpriteNode spriteNodeWithColor:[SKColor blueColor] size: CGSizeMake(10.0, 20.0)];
        self.player.position = CGPointMake(20.0, self.frame.size.height/2);
        self.player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.player.size];
        self.player.physicsBody.dynamic = YES;
        self.player.physicsBody.categoryBitMask = playerCategory;
        self.player.physicsBody.contactTestBitMask = tileCategory & powerupCategory;
        self.player.physicsBody.collisionBitMask = tileCategory;
        self.maxVel = 10.0;
        
        [self.gameNode addChild:self.player];
        self.centerNode = self.player;
        
        self.physicsWorld.gravity = CGVectorMake(0.0, 0.0);
        self.physicsWorld.contactDelegate = self;
        self.lifting = false;
        
        self.level = [[FlatLevelGenerator alloc] initWithScene:self];
        
        //add the action for the ship to move forward forever!
        [self.player runAction:[SKAction repeatActionForever:[SKAction moveByX:50.0 y:0.0 duration:1.0]] withKey:@"infiniteRight"];
    }
    return self;
}

- (void) didSimulatePhysics
{
    [super didSimulatePhysics];
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    UITouch *touch = [touches anyObject];
    //self.touchOrigin = [touch locationInNode:self];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    NSSet *allTouches = [event allTouches];
    //TODO: remove this? why do i ahve it lol.
    int count = 0;
    for (UITouch* touch in allTouches) {
        if(++count == 2) //second touch ending
            NSLog(@"second touch ended");
    }
    self.player.physicsBody.velocity = CGVectorMake(0.0, 0.0);
}

-(void)update:(CFTimeInterval)currentTime {
    [super update:currentTime];
    
    /* Called before each frame is rendered */
    
    [self.level updateWithXTraveled:self.player.position.x - 20.0];
}

//physics
- (void)didBeginContact:(SKPhysicsContact *)contact
{
    SKPhysicsBody *firstBody, *secondBody;
    
    if(contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask)
    {
        firstBody = contact.bodyA;
        secondBody = contact.bodyB;
    } else {
        firstBody = contact.bodyB;
        secondBody = contact.bodyA;
    }
}

//physics methods
- (void)playerCrashed:(SKSpriteNode*) player withTile: (SKSpriteNode*) tile
{

}

@end
