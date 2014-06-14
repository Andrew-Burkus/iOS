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
    SKAction *runsForward;
    
    SKAction *joyStickMovesLeft;
    
    SKAction *joyStickMovesRight;
    
    SKAction *joyStickDefault;
    
    SKTexture *defaultJoyStick;
}

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */

#pragma - mark "Character Setup"
        playerTextures *playerAnims = [[playerTextures alloc]initPlayerTextures];
        
        Character *player = [[Character alloc] initWithImage:@"idle1"];
        
        [player setName:@"player"];
        
        [player setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        
        [player setScale:1.0];
        
        [self addChild:player];
        
        SKAction *moveRight = [SKAction moveByX:10.0 y:0.0 duration:playerAnims.runForwardTextures.count * 0.33];
        
        runsForward = [SKAction group: @[
        [SKAction animateWithTextures:playerAnims.runForwardTextures timePerFrame:0.033],
                       moveRight]];

#pragma - mark "JoyStick Setup"
        SKSpriteNode *joyStick = [[SKSpriteNode alloc] initWithImageNamed:@"JoyStickIdle"];
        
        [joyStick setScale:1.0];
        
        [joyStick setPosition:CGPointMake(50, 25)];
        
        [joyStick setName:@"joyStick"];
        
        [self addChild:joyStick];
        
        defaultJoyStick = [joyStick texture];
        
        joyStickDefault = [SKAction setTexture:defaultJoyStick];
        
        joyStickMovesLeft = [SKAction group: @[
        [SKAction animateWithTextures:playerAnims.joyStickLeftTextures timePerFrame:0.033],
        defaultJoyStick ]];
        
        joyStickMovesRight = [SKAction group: @[
        [SKAction animateWithTextures:playerAnims.joyStickRightTextures timePerFrame:0.033],
        defaultJoyStick ]];

        
#pragma - mark "scene stuff"
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(self.position.x, self.position.y + 100, self.frame.size.width, self.frame.size.height)];
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -0.5);
        
    }
    
    return self;
    
}

- (void)didMoveToView: (SKView *) view {
    
    if (!self.contentCreated) {
        
        [self createSceneContents];
        
            self.contentCreated = YES;
        
    }
    
}

#pragma - mark "Content Creation"

- (void)createSceneContents {

 
}

#pragma - mark "Touched"
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    
    SKNode *joyStick = [self childNodeWithName:@"joyStick"];
    
    if(CGRectContainsPoint(joyStick.frame, location)) {
        if(location.x > joyStick.frame.size.width / 2) {
            [joyStick runAction:joyStickMovesLeft];
            
        } else {
            if(location.x > joyStick.frame.size.height / 2) {
                [joyStick runAction:joyStickMovesRight];

            }
        }
    }
    
    
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
