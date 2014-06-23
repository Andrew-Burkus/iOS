//
//  Chief.m
//  Adventures of Turing
//
//  Created by iD Student on 6/16/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "Chief.h"

@interface Chief ()

@end

@implementation Chief {
    
#pragma mark - Movement
    
    SKAction *moveFast;
    
    SKAction *jumpUp;
    
    SKAction *reverseJump;
    
#pragma mark - Animations
    
    SKAction *run;
    
    SKAction *jump;
    
    SKAction *reload;
    
    //audio
    
    SKAction *reloadGun;
    
    SKAction *shot;
}

            /*****Initiliaze Character*****/

-(id)initChiefAtPosition:(CGPoint)point {
    if([super initWithImageNamed:@"DefaultChief"]) {
        [self setPosition:point];
        [self setUserInteractionEnabled:YES];
        [self setScale:1.25];
        
        self.currentWeapon = @"Pistol";
        moveFast = [SKAction moveToX:self.position.x + 3.5 duration:0.033];
        
            /*****Run*****/
        
        NSArray *s = [self loadAnimationFor:@"PistolRun" withFrames:6];
        SKAction *runAnimation = [SKAction animateWithTextures:s timePerFrame:0.09];
        SKAction *grouped = [SKAction group:@[moveFast, runAnimation]];
        run = [SKAction repeatActionForever:grouped];
        
        
            /*****Reload*****/

        NSMutableArray *reloadTextures = [self loadAnimationFor:@"PistolReload" withFrames:7];
        reload = [SKAction animateWithTextures:reloadTextures timePerFrame:0.1];
        

            /*****Jump*****/
        
        jumpUp = [SKAction moveToY:self.position.y + 70 duration:0.2];
        reverseJump = [SKAction moveToY:self.position.y - 1 duration:0.3];
        
        SKTexture *j = [SKTexture textureWithImageNamed:@"PistolJump"];
        jump = [SKAction sequence:@[[SKAction setTexture:j], jumpUp, reverseJump]];
        
        
            //begin
        
        [self runAction:run];
    }
    return  self;
}


                /****** Event Handling *****/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

    /***** Getter *****/

-(NSString *)getCurrentWeapon {
    return self.currentWeapon;
}


            /***** Responses to Scene Events *****/

-(void)attackResponse {
    shot = [SKAction playSoundFileNamed:@"PistolShot.mp3" waitForCompletion:YES];
    [self runAction:shot];
}

-(void)jumpResponse {
    [self runAction:jump];
    SKAction *jumpSound = [SKAction playSoundFileNamed:@"jump.wav" waitForCompletion:YES];
    [self runAction:jumpSound];
    [self runAction:run];
}

-(void)reloadResponse {
    reloadGun = [SKAction playSoundFileNamed:@"PistolReloadSound.mp3" waitForCompletion:YES];
    [self runAction:reloadGun];
    [self runAction:reload];
}




                        /***** pickUpWeapon Method for ID System ****/

- (void)pickUpWeapon:(Weapon *)weapon {
    self.currentWeapon = [weapon name];
    
        /*****Change Jump*****/
    
    NSString *newJump = [NSString stringWithFormat:@"%@Jump",self.currentWeapon];
    SKTexture *j = [SKTexture textureWithImageNamed:newJump];
    jump = [SKAction sequence:@[[SKAction setTexture:j], jumpUp, reverseJump]];
    
        /*****Change Reload*****/
    
    NSString *newReload = [NSString stringWithFormat:@"%@Reload",self.currentWeapon];
    reload = [SKAction animateWithTextures:
              [self loadAnimationFor:newReload withFrames:7] timePerFrame:0.1];
    
        /*****Change Run*****/
    
    NSString *newRun = [NSString stringWithFormat:@"%@Run",self.currentWeapon];
    
    run =[SKAction repeatActionForever:
          [SKAction group: @[[SKAction animateWithTextures:
                              [self loadAnimationFor:newRun withFrames:6] timePerFrame:0.08], moveFast]]];
    
    //resume with new animation
    
    [self runAction:run];
}

            /***** Animation Loader for Memory Conservation*****/

- (NSMutableArray *)loadAnimationFor:(NSString *)name withFrames:(int)frames {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(int i = 1; i <= frames; i++) {
        NSString *frameName = [NSString stringWithFormat:@"%@%d", name, i];
        
        SKTexture *frameToLoad = [SKTexture textureWithImageNamed:frameName];
        if(frameToLoad)
            [array addObject:frameToLoad];
    }
    return array;
}

@end
