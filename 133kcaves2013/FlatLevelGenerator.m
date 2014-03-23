//
//  FlatLevelGenerator.m
//  133kcaves2013
//
//  Created by Jason McCarrell on 2013-11-13.
//  Copyright (c) 2013 Jason McCarrell. All rights reserved.
//

#import "FlatLevelGenerator.h"

const CGFloat PEICE_WIDTH = 10;

@implementation FlatLevelGenerator

- (LevelGenerator*) initWithScene: (InfiniteOffsetScene*)scene
{
    self = [super initWithScene:scene];
    
    [self generateWithBuffer:self.scene.size.width + LEVEL_BUFFER withXTraveled:0.0];
    
    return self;
}

- (void) generateWithBuffer: (CGFloat) buffer withXTraveled: (CGFloat) x_traveled
{
    NSLog(@"BUFFERING FLAT");
    int bufferTilesWide = (int) (buffer / PEICE_WIDTH);
    
    //generate the tiles, top and bot, col by col
    for(int i = 0; i < bufferTilesWide; ++i)
    {
        CGFloat visual_x = self.x_generated + (i * PEICE_WIDTH);
        
        [self addSquareWithX:visual_x withY:0 withWidth:PEICE_WIDTH];
        [self addSquareWithX:visual_x withY:self.scene.size.height - PEICE_WIDTH withWidth:PEICE_WIDTH];
    }
    
    self.x_generated += bufferTilesWide * PEICE_WIDTH;
    NSLog(@"updated: %f", self.x_generated);
}

@end
