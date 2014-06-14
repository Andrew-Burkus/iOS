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
    
#pragma - mark "Player Animation Declarations"
    
    SKAction *crouch;
    
    SKAction *shoot;
    
    SKAction *throw;
    
    SKAction *animateForward;
    
    SKAction *runsForward;
    
    SKAction *animateBackward;
    
    SKAction *runsBackwards;
    
    SKAction *grenade;
    
#pragma - mark "JoyStick Declarations"
    
    SKAction *joyStickMovesLeft;
    
    SKAction *joyStickMovesRight;
    
    SKAction *joyStickDefault;
    
#pragma - mark "Button Declarations"
    
    SKAction *aButtonDefault;
    
    SKAction *aButtonDown;
    
    SKAction *bButtonDefault;
    
    SKAction *bButtonDown;
}

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */

#pragma - mark "Background"
        SKSpriteNode *background = [SKSpriteNode spriteNodeWithImageNamed:@"Scene2"];
        
        [background setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame) + 70)];
        
        [background setScale:0.6];
        
        [self addChild:background];
        
#pragma - mark "Character Setup"
        
        playerTextures *playerAnims = [[playerTextures alloc]initPlayerTextures];
        
        Character *player = [[Character alloc] initWithImage:@"Idle1"];
        
        [player setName:@"player"];
        
        [player setPosition:CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2)];
        
        [player setScale:1.0];
        
        [self addChild:player];
        
#pragma - mark "Player Animation Init"
        
        animateForward = [SKAction group: @[
        [SKAction animateWithTextures:playerAnims.walkingTextures timePerFrame:0.33],
        [SKAction moveByX:10.0 y:0.0 duration:playerAnims.runningTextures.count * 0.33]]];
        
        runsForward = [SKAction sequence: @[animateForward,
                            [SKAction setTexture:[player texture]]]];
        
        animateBackward = [SKAction group: @[
        [SKAction animateWithTextures:playerAnims.runningTextures timePerFrame:0.33],
        [SKAction moveByX:-10.0 y:0.0 duration:0.33]
                                            ]];
        
        runsBackwards = [SKAction sequence: @[animateBackward,
                                [SKAction setTexture:[player texture]]]];
        
        crouch = [SKAction animateWithTextures:playerAnims.crouchTextures timePerFrame:0.33];
        
        
#pragma - mark "Grenade Animation"
        throw = [SKAction animateWithTextures:playerAnims.throwingTextures timePerFrame:0.33];
        
        SKAction *moving = [SKAction moveTo:CGPointMake(0, 30)
                                   duration: 0.033];
        
        grenade = [SKAction group: @[
        [SKAction animateWithTextures:playerAnims.grenadeTextures timePerFrame:0.033],
            moving]];
        
#pragma - mark "JoyStick Setup"
        
        SKSpriteNode *joyStick = [[SKSpriteNode alloc] initWithImageNamed:@"JoyStickIdle"];
        
        [joyStick setScale:2.0];
        
        [joyStick setPosition:CGPointMake(60, 25)];
        
        [joyStick setName:@"joyStick"];
        
        [self addChild:joyStick];
        
        joyStickDefault = [SKAction setTexture:[joyStick texture]];
        
        joyStickMovesLeft = [SKAction sequence: @[
        [SKAction animateWithTextures:playerAnims.joyStickLeftTextures timePerFrame:0.033],
        joyStickDefault]];
        
        joyStickMovesRight = [SKAction sequence: @[
        [SKAction animateWithTextures:playerAnims.joyStickRightTextures timePerFrame:0.033],
        joyStickDefault]];
        
#pragma - mark "Button A Setup"
        
        SKSpriteNode *aButton = [[SKSpriteNode alloc] initWithImageNamed:@"AButtonIdle"];
        
        [aButton setScale:1.5];
        
        [aButton setName:@"aButton"];
        
        [aButton setPosition:CGPointMake(270, 20)];
        
        [self addChild:aButton];
        
        aButtonDefault = [SKAction setTexture:[aButton texture]];
        
        SKAction *aDown = [SKAction animateWithTextures:playerAnims.AButtonTextures timePerFrame:0.033];
        
        aButtonDown = [SKAction sequence:@[aDown, aButtonDefault]];
        
#pragma - mark "Button B Setup"
        
        SKSpriteNode *bButton = [[SKSpriteNode alloc] initWithImageNamed:@"BButtonIdle"];
        
        [bButton setScale:1.5];
        
        [bButton setName:@"bButton"];
        
        [bButton setPosition:CGPointMake(200, 20)];

        
        [self addChild:bButton];
        
        bButtonDefault = [SKAction setTexture:[bButton texture]];
        
        SKAction *bDown = [SKAction animateWithTextures:playerAnims.BButtonTextures timePerFrame:0.033];
        
        bButtonDown = [SKAction sequence:@[bDown, bButtonDefault]];
        
        
#pragma - mark "Scene Physics Settings"
        
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(self.position.x, self.position.y + 100, self.frame.size.width, self.frame.size.height)];
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -1.5);
        
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
    
    SKNode *player = [self childNodeWithName:@"player"];
    
    SKNode *aButton = [self childNodeWithName:@"aButton"];
    
    SKNode *bButton = [self childNodeWithName:@"bButton"];
    
    if(CGRectContainsPoint(joyStick.frame, location)) {
        if(location.x < 60) {
            [joyStick runAction:joyStickMovesLeft];
            [player runAction:runsBackwards];
            
        } else {
            if(location.x > 60) {
                [joyStick runAction:joyStickMovesRight];
                [player runAction:runsForward];
                
            }
        }
    } else {
        if(CGRectContainsPoint(aButton.frame, location)) {
            [aButton runAction:aButtonDown];
            [player runAction:throw];
            
        } else {
            if(CGRectContainsPoint(bButton.frame, location)) {
                [bButton runAction:bButtonDown];
                [player runAction:crouch];
            }
        }
    }

   }

#pragma - mark "Touch Moved"
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    
    SKNode *joyStick = [self childNodeWithName:@"joyStick"];
    
    SKNode *player = [self childNodeWithName:@"player"];
    
    if(CGRectContainsPoint(joyStick.frame, location)) {
        if(location.x < 60) {
            [joyStick runAction:joyStickMovesLeft];
            [player runAction:runsBackwards];
            
        } else {
            if(location.x > 60) {
                [joyStick runAction:joyStickMovesRight];
                [player runAction:runsForward];
                
            }
        }
   }
}


#pragma - mark "Touch Ended"
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    SKNode *joyStick = [self childNodeWithName:@"joyStick"];
    
    SKNode *aButton = [self childNodeWithName:@"aButton"];
    
    SKNode *bButton = [self childNodeWithName:@"bButton"];

    [joyStick runAction:joyStickDefault];
    
    [aButton runAction:aButtonDefault];
    
    [bButton runAction:bButtonDefault];
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    
}

@end
