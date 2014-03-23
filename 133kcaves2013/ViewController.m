//
//  ViewController.m
//  133kcaves2013
//
//  Created by Jason McCarrell on 2013-11-13.
//  Copyright (c) 2013 Jason McCarrell. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

 - (void)viewWillLayoutSubviews
{
    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.multipleTouchEnabled = true;
    if(!skView.scene)
    {
        skView.showsFPS = YES;
        skView.showsNodeCount = YES;
        
        
        // Create and configure the scene.
        SKScene * scene = [MyScene sceneWithSize:skView.bounds.size];
        scene.scaleMode = SKSceneScaleModeAspectFill;
        
        // Present the scene.
        [skView presentScene:scene];
    }
    [super viewWillLayoutSubviews];
}

- (BOOL)shouldAutorotate
{
    return YES;
}

- (NSUInteger)supportedInterfaceOrientations
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return UIInterfaceOrientationMaskAllButUpsideDown;
    } else {
        return UIInterfaceOrientationMaskAll;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
