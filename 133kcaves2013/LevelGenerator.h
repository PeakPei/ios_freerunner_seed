//
//  LevelGenerator.h
//  133kcaves2013
//
//  Created by Jason McCarrell on 2013-11-13.
//  Copyright (c) 2013 Jason McCarrell. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "InfiniteOffsetScene.h"

static const CGFloat LEVEL_BUFFER = 40.0;
static const uint32_t playerCategory    =   0x1 << 0;
static const uint32_t tileCategory      =   0x1 << 1;
static const uint32_t powerupCategory   =   0x1 << 2;

@interface LevelGenerator : NSObject

@property InfiniteOffsetScene* scene;

@property CGFloat x_generated;

@property NSMutableSet* tiles;

- (LevelGenerator*) initWithScene: (InfiniteOffsetScene*)scene;

- (void) updateWithXTraveled: (CGFloat) x;

- (void) generateWithBuffer: (CGFloat) buffer withXTraveled: (CGFloat) x_traveled;

- (void) addSquareWithX: (CGFloat) x withY: (CGFloat) y withWidth: (CGFloat) width;

@end
