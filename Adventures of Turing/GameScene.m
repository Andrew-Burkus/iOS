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

- (float)differenceBetweenVectors:(CGPoint)a and:(CGPoint)b;

- (CGPoint)addVectors:(CGPoint)a and:(CGPoint)b;

@end


@implementation GameScene {
    
        /*****Backgrounds*****/
    
    SKSpriteNode *staticBackground;
    
    SKSpriteNode *scrollingBackground;
    
    SKSpriteNode *scrollingBackground2;
    
        /*****Buttons*****/
    
    Booton *attackButton;
    
    Booton *reloadButton;
    
    Booton *jumpButton;
    
        /*****Icons*****/
    
    SKSpriteNode *killsIcon;
    
    NSMutableArray *healthIcons;
    
        /*****SceneContents*****/
    
    SKSpriteNode *mysteryBox;
    
    Grunt *testGrunt;
    
        /*****KillCounter*****/
    
    KillCounter *killCounterLeft;
    
    KillCounter *killCounterRight;
    
    NSString *currentWeapon;
    
    Chief *chief;
    
        /*****Audio*****/
    
    SKAction *throwGrunt;
}

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {

            /*****StaticBackground*****/
        
        staticBackground = [SKSpriteNode spriteNodeWithImageNamed:@"USMC"];
        
        [staticBackground setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        
        [staticBackground setSize:self.size];
        
            /*****DynamicBackgrounds*****/
        
        scrollingBackground = [SKSpriteNode spriteNodeWithImageNamed:@"Covenant"];
        
        [scrollingBackground setPosition:CGPointMake(CGRectGetMidX(self.frame), self.size.height - 55)];
        
        [scrollingBackground setSize:self.size];
        
        [scrollingBackground setScale:1.0];
        
                //second...
        
        scrollingBackground2 = [SKSpriteNode spriteNodeWithImageNamed:@"Covenant"];
        
        [scrollingBackground2 setPosition:CGPointMake(CGRectGetMidX(self.frame) + scrollingBackground.frame.size.width, self.size.height - 55)];
        
        [scrollingBackground2 setSize:self.size];
        
        [scrollingBackground2 setScale:1.0];
        
        
            /*****Audio*****/
        
        
        
            /*****Chief Setup*****/
        
        chief = [[Chief alloc] initChiefAtPosition:CGPointMake(20, self.size.height / 3 + 18)];
        
    
            /*****Buttons*****/
        
        attackButton = [[Booton alloc] initBootonWithImage:@"FireBooton" atPosition:
                        CGPointMake(30, self.size.height / 3 - 45)];
        [attackButton setScale:0.15];
        
        reloadButton = [[Booton alloc] initBootonWithImage:@"ReloadBooton"
                                    atPosition:CGPointMake(attackButton.size.width + 50, self.size.height / 3 - 45)];
        [reloadButton setScale:0.15];
        
        jumpButton =  [[Booton alloc]initBootonWithImage:@"JumpBooton"
                                        atPosition:CGPointMake(self.frame.size.width - 80, attackButton.position.y)];
        [jumpButton setScale:0.15];
        
            /*****Icons*****/
        
        killsIcon = [SKSpriteNode spriteNodeWithImageNamed:@"KillsIcon"];
        [killsIcon setScale:0.15];
        [killsIcon setPosition:CGPointMake(35, self.frame.size.height - 12)];
        
            /*****List of Health Icons for Classical Style*****/
        
        healthIcons = [[NSMutableArray alloc]init];
        float xpos = self.frame.size.width - 120;
        float ypos = self.frame.size.height - 30;
        for(int i = 0; i < 3; i++) {
            healthIcons[i] = [SKSpriteNode spriteNodeWithImageNamed:@"HealthIcon"];
            [healthIcons[i] setScale:0.1]; [healthIcons[i] setPosition:CGPointMake(xpos, ypos)];
            xpos += 30;
        }
        
            /*****Classic Counters*****/
        
        killCounterLeft = [[KillCounter alloc]initKillCounterAtPosition:
                       CGPointMake(60, self.frame.size.height - 20)];
        
        killCounterRight = [[KillCounter alloc]initKillCounterAtPosition:
                            CGPointMake(killCounterLeft.position.x + 16,
                                            killCounterLeft.position.y)];
        
            /*****Testing*****/
        
    }
    return self;
}


#pragma mark - View Confirmation

- (void)didMoveToView: (SKView *) view {
    
    if (!self.contentCreated) {
        
        [self createSceneContents];
        
        self.contentCreated = YES;
    }
}


#pragma mark - Content Creation

- (void)createSceneContents {
    
        /***** Backgrounds *****/
    
    [self addChild:staticBackground];
    
    [self addChild:scrollingBackground];
    
    [self addChild:scrollingBackground2];
    
        /*****Buttons*****/
    
    [self addChild:attackButton];
    
    [self addChild:reloadButton];
    
    [self addChild:jumpButton];
    
        /*****Icons*****/
    
    [self addChild:killCounterLeft];
    
    [self addChild:killCounterRight];
    
    [self addChild:killsIcon];
    
    for(int i = 0; i < 3; i++) {
        [self addChild:healthIcons[i]];
    }
    
        /*****Characters*****/
    
    [self addChild:chief];
    
        /*****Testing*****/
    
    testGrunt = [[Grunt alloc]initGruntAtPosition:
                 CGPointMake(self.frame.size.width - 100, chief.position.y)];
    
    throwGrunt =[SKAction sequence:@[[SKAction repeatActionForever:[SKAction group:@[
                    [SKAction animateWithTextures:[testGrunt flail] timePerFrame:0.09],
                    [SKAction moveToX:-50 duration:3.0]]]]]];

    [self addChild:testGrunt];
}


#pragma mark - Event Handling

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

#pragma mark - Update

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
        /*****Background Movement*****/
    
    if(scrollingBackground.frame.origin.x + scrollingBackground.frame.size.width < 0) {
        
        [scrollingBackground setPosition:CGPointMake(750, scrollingBackground.position.y)];
        
    } else {
        [scrollingBackground setPosition:
         CGPointMake(scrollingBackground.position.x - 1, scrollingBackground.position.y)];
    }

    if(scrollingBackground2.frame.origin.x + scrollingBackground2.frame.size.width < 0) {
        
        [scrollingBackground2 setPosition:CGPointMake(750, scrollingBackground2.position.y)];
        
    } else {
        
        [scrollingBackground2 setPosition:
         CGPointMake(scrollingBackground2.position.x - 1, scrollingBackground2.position.y)];
    }
    
        /*****Event Handling Buttons*****/
    
    if([attackButton isTouched]) {
        
        Weapon *toShoot = [[Weapon alloc]initWeaponNamed:currentWeapon];
        NSMutableArray *weaponAnimation = [toShoot getWeaponAnimation];
        SKTexture *projectile = [toShoot getBulletTexture];
        SKSpriteNode *bullet = [SKSpriteNode spriteNodeWithTexture:projectile];
        SKSpriteNode *event = [SKSpriteNode spriteNodeWithTexture:weaponAnimation[0]];
        CGPoint location = CGPointMake(chief.position.x + chief.frame.size.width / 2 + 4,
                                       chief.position.y + 10);
        [event setPosition:location];
        [bullet setPosition:location];
        
        SKAction *moveBullet = [SKAction moveToX:self.frame.size.width duration:0.2];
        SKAction *remove = [SKAction removeFromParent];
        SKAction *final = [SKAction sequence:@[moveBullet, remove]];
        SKAction *first = [SKAction animateWithTextures:weaponAnimation timePerFrame:0.033];
        SKAction *fire = [SKAction sequence:@[first,remove]];
        
        [bullet setScale:0.5];
        [event setScale:1.0];
        [self addChild:event];
        [event runAction:fire];
        [self addChild:bullet];
        [bullet runAction:final];
        [chief attackResponse];
    }
    
    if([reloadButton isTouched]) {
        [chief reloadResponse];
    }
    
    if([jumpButton isTouched]) {
        [chief jumpResponse];
    }
    currentWeapon = [chief getCurrentWeapon];
    
        /*****Grunt Checks*****/
    
    [testGrunt runAction:throwGrunt];
    
    if(testGrunt.position.x < -49) {
        [testGrunt setPosition:CGPointMake(self.frame.size.width + 1000, testGrunt.position.y)];
    }
}
                                 

- (float)differenceBetweenVectors:(CGPoint)a and:(CGPoint)b {
    float x = pow((a.x - b.x), 2);
    float y = pow((a.y - b.y), 2);
    
    return sqrt(x + y);
}

- (CGPoint)addVectors:(CGPoint)a and:(CGPoint)b {
    float x = a.x + b.x;
    float y = a.y + b.y;
    
    return CGPointMake(x, y);
}



@end
