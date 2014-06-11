//
//  spriteMyScene.m
//  Adventures of Turing
//
//  Created by iD Student on 6/9/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "GameScene.h"

@interface GameScene ()

@property BOOL contentCreated;

@end


@implementation GameScene {
    
}
    
-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        //self.backgroundColor = [SKColor colorWithRed:0.15 green:0.15 blue:0.3 alpha:1.0];
        
        //SKLabelNode *myLabel = [SKLabelNode labelNodeWithFontNamed:@"Chalkduster"];
        
        //myLabel.text = @"Hello, World!";
        //myLabel.fontSize = 30;
        //myLabel.position = CGPointMake(CGRectGetMidX(self.frame),
         //                              CGRectGetMidY(self.frame));
        
    }
    
    return self;
    
}

- (void)didMoveToView: (SKView *) view {
    
    if (!self.contentCreated) {
        [self createSceneContents];
        self.contentCreated = YES;
    }
}

#pragma - mark Content Creation
- (void)createSceneContents {
    
    self.scaleMode = SKSceneScaleModeAspectFit;
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInNode:self];
    
    playerSpriteNode *player = [[playerSpriteNode alloc] initWithImage:@"Base_Model_Enemy"];
    
    [player setPosition:location];
    
    [self addChild:player];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
