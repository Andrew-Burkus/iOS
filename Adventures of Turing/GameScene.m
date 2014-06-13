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

@property SKSpriteNode *dPadTop;

@property SKSpriteNode *dPadLeft;

@property SKSpriteNode *dPadRight;

@property SKSpriteNode *dPadBottom;

@property (strong, nonatomic) SKAction *jump;

@end


@implementation GameScene

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.user = [[playerNode alloc] initWithImageNamed:@"idle1"];
        [self.user setScale:1.0];
        
        self.dPadTop = [[SKSpriteNode alloc] initWithImageNamed:@"dpad"];
            [self.dPadTop setScale:0.25];
        self.dPadBottom = [[SKSpriteNode alloc] initWithImageNamed:@"dpad"];
            [self.dPadBottom setScale:0.25];
        self.dPadLeft = [[SKSpriteNode alloc] initWithImageNamed:@"dpad"];
            [self.dPadLeft setScale:0.25];
        self.dPadRight = [[SKSpriteNode alloc] initWithImageNamed:@"dpad"];
            [self.dPadRight setScale:0.25];
        
        self.jump = [SKAction animateWithTextures:self.user.jumpTextures timePerFrame:0.033];
        
    }
    
    return self;
    
}

#pragma - mark "Content Creation & View Confirm"

- (void)didMoveToView: (SKView *) view {
    
    if (!self.contentCreated) {
        
        [self createSceneContents];
        
            self.contentCreated = YES;
        
    }
    
}

#pragma - mark "Content Creation"

- (void)createSceneContents {
    
    [self addChild:self.user];

#pragma - mark "Add Dpad"
    [self addChild:self.dPadTop];
    [self addChild:self.dPadBottom];
    [self addChild:self.dPadLeft];
    [self addChild:self.dPadRight];
    
    [self.dPadTop setPosition:CGPointMake(50,100)];
    [self.dPadBottom setPosition:CGPointMake(50,50)];
    [self.dPadLeft setPosition:CGPointMake(20,75)];
    [self.dPadRight setPosition:CGPointMake(80,75)];
    
}

#pragma - mark "Touched"
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    
    [self.user setPosition:location];
}

#pragma - mark "Touch Moved"
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
}


#pragma - mark "Touch Ended"
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
}

@end
