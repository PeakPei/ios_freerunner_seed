//
//  InfiniteOffsetNode.h
//  133kcaves2013
//
//  Created by Jason McCarrell on 2013-11-15.
//  Copyright (c) 2013 Jason McCarrell. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface InfiniteOffsetScene : SKScene

@property (nonatomic) CGPoint centerNodeOffset;
@property (nonatomic) SKSpriteNode* gameNode;
@property (nonatomic) SKSpriteNode* centerNode;
//shouldnt be public
@property (nonatomic) bool isTransitioningOut;

@end
