//
//  InfiniteOffsetNode.m
//  133kcaves2013
//
//  Created by Jason McCarrell on 2013-11-15.
//  Copyright (c) 2013 Jason McCarrell. All rights reserved.
//

#import "InfiniteOffsetScene.h"

@implementation InfiniteOffsetScene

//TODO: centerNode isn't initiated or anything, that is bad... figure out a better inti or something.
//TODO: ugh, also ive lost control of the y... need a better solution.
-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        self.centerNodeOffset = CGPointZero;
        self.isTransitioningOut = false;
        
        self.gameNode = [SKSpriteNode spriteNodeWithColor:[SKColor whiteColor] size: CGSizeMake(size.width, size.height)];
        self.gameNode.anchorPoint = CGPointZero;
        self.gameNode.position = CGPointZero;
        self.centerNodeOffset = CGPointMake(20.0, (self.size.height/2)); //TODO: CHEATING!!!!! it's the ships starting x
        [self addChild:self.gameNode];
    }
    return self;
}

-(void)update:(CFTimeInterval)currentTime {
    [self.gameNode.children enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL* stop) {
        SKNode* node = object;
        node.position = CGPointMake(node.position.x + self.centerNodeOffset.x - 20.0, node.position.y + self.centerNodeOffset.y - (self.size.height/2));
        
        if(node.position.x < self.centerNodeOffset.x - 80.0 - 10.0)
            [node removeFromParent];
    }];
}

-(void)didSimulatePhysics
{
    self.centerNodeOffset = self.centerNode.position;
    [self.gameNode.children enumerateObjectsUsingBlock:^(id object, NSUInteger index, BOOL* stop) {
        SKNode* node = object;
        node.position = CGPointMake(node.position.x - self.centerNodeOffset.x + 20.0, node.position.y - self.centerNodeOffset.y + (self.size.height/2));
    }];
}

@end
