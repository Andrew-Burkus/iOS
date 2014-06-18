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
    
    SKAction *move;
    
    SKAction *moveFast;
    
    SKAction *walk;
    
    SKAction *run;
}

-(id)initChiefAtPosition:(CGPoint)point {
    if([super initWithImageNamed:@"DefaultChief"]) {
        [self setPosition:point];
        [self setUserInteractionEnabled:YES];
        [self setScale:0.75];
        
        self.currentWeapon = @"Pistol";
        
        self.physicsBody.affectedByGravity = YES;
        
        moveFast = [SKAction moveToX:self.position.x + 3.5 duration:0.033];
        move = [SKAction moveToX:self.position.x + 3 duration:0.033];

        
        NSMutableArray *textures = [[NSMutableArray alloc] init];
        [self loadTexturesFor:@"BruteShotWalk" inArray:textures];
              SKAction *second = [SKAction animateWithTextures:textures timePerFrame:0.09];
        SKAction *group = [SKAction group:@[move, second]];
        walk = [SKAction repeatActionForever:group];
        
        NSArray *s = [self loadAnimationFor:@"BruteShotRun" withFrames:6];
        
        SKAction *secon = [SKAction animateWithTextures:s timePerFrame:0.09];
        SKAction *grou = [SKAction group:@[moveFast, secon]];
        run = [SKAction repeatActionForever:grou];
        
       // [self runAction:walk];
    }
    return  self;
}

- (void)pickUpWeapon:(Weapon *)weapon {
    self.currentWeapon = [weapon name];
    NSString *new = [NSString stringWithFormat:@"%@Walk",self.currentWeapon];
    
    NSMutableArray *textures = [self loadAnimationFor:new withFrames:6];
    NSString *other = [NSString stringWithFormat:@"%@Run",self.currentWeapon];
    SKAction *animate = [SKAction group: @[[SKAction animateWithTextures:textures timePerFrame:0.09], move]];
    NSMutableArray *runTextures = [self loadAnimationFor:other withFrames:6];
    run =[SKAction repeatActionForever:[SKAction group: @[[SKAction animateWithTextures:runTextures timePerFrame:0.08], moveFast]]];
    walk = [SKAction repeatActionForever:animate];
    
    [self runAction:walk];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self runAction:run];
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    
    CGPoint loc = [touch locationInNode:self.parent];
    
    [self setPosition:loc];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self removeAllActions];
    //[self runAction:walk];
}

- (void)loadTexturesFor:(NSString *)name inArray:(NSMutableArray *)array {
    
    for(int i = 1; i <= 6; i++) {
       NSString *frameName = [NSString stringWithFormat:@"%@%d", name, i];
        
        SKTexture *frameToLoad = [SKTexture textureWithImageNamed:frameName];
        if(frameToLoad)
            [array addObject:frameToLoad];
        else
            return;
    }
}

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
