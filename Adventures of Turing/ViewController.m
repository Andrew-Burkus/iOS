//
//  spriteViewController.m
//  Adventures of Turing
//
//  Created by iD Student on 6/9/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "ViewController.h"
#import "GameScene.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewWillAppear:(BOOL)animated {
    
    GameScene *scene = [[GameScene alloc] initWithSize:CGSizeMake(768,1024)];
    SKView *spriteView = (SKView *) self.view;
    
    [spriteView presentScene: scene];
}

-(BOOL)prefersStatusBarHidden {
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
