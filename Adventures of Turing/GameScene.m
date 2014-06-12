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

@property playerNode *user;

@property dPad *controls;

@end


@implementation GameScene

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.user = [[playerNode alloc] init];
        
        self.controls = [[dPad alloc] initWithImageNamed:@"D_PAD_Circle"];
    }
    
    return self;
    
}

#pragma - mark Content Creation & View Confirm

- (void)didMoveToView: (SKView *) view {
    
    if (!self.contentCreated) {
        
        [self createSceneContents];
        
            self.contentCreated = YES;
        
    }
    
}

#pragma - mark Content Creation

- (void)createSceneContents {
    
    [self addChild:self.user];

    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
}

@end
