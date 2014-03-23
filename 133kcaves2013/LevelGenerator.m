//
//  LevelGenerator.m
//  133kcaves2013
//
//  Created by Jason McCarrell on 2013-11-13.
//  Copyright (c) 2013 Jason McCarrell. All rights reserved.
//

#import "LevelGenerator.h"

@implementation LevelGenerator

- (LevelGenerator*) initWithScene: (InfiniteOffsetScene*)scene
{
    self = [self init];
    
    self.scene = scene;
    
    return self;
}

- (void) updateWithXTraveled: (CGFloat) x_traveled
{
    //NSLog(@"traveled: %f", x_traveled);
    if(x_traveled > self.x_generated - self.scene.size.width - LEVEL_BUFFER)
        [self generateWithBuffer: LEVEL_BUFFER withXTraveled:x_traveled];
    
    /* This doesn't work... so perhaps remove it.
    for(SKSpriteNode* tiles in self.tiles)
        if(tiles.position.x < x_traveled - LEVEL_BUFFER) //TODO: take scene.width out
            [tiles removeFromParent];
     */
}

- (void) generateWithBuffer: (CGFloat) buffer withXTraveled: (CGFloat) x_traveled
{
    [NSException raise:NSInternalInconsistencyException
                format:@"You must override %@ in a subclass", NSStringFromSelector(_cmd)];
}

- (void) addSquareWithX: (CGFloat) x withY: (CGFloat) y withWidth: (CGFloat) width
{
    SKSpriteNode* square = [SKSpriteNode spriteNodeWithColor:[SKColor blackColor] size:CGSizeMake(width-1.0, width)];
    square.position = CGPointMake(x, y);
    square.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:square.size];
    
    square.anchorPoint = CGPointZero; //position based on top-left corner
    square.physicsBody.affectedByGravity = false;
    square.physicsBody.dynamic = YES;
    square.physicsBody.categoryBitMask = tileCategory;
    square.physicsBody.contactTestBitMask = playerCategory;
    
    //add tile to the scene
    [self.scene.gameNode addChild:square];
    
    //add tile to our set TODO: this doesn't work. Maybe just remove it.
    //[self.tiles addObject:square];
    NSLog(@"tiles count:%lu", (unsigned long)self.scene.gameNode.children.count);
}

@end
