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
    SKSpriteNode *staticBackground;
    
    SKSpriteNode *scrollingBackground;
    
    SKSpriteNode *mysteryBox;
    
    SKSpriteNode *sexy;
    
    Chief *chief;
    
    NSMutableArray *weapons;
}

-(id)initWithSize:(CGSize)size {
    
    if (self = [super initWithSize:size]) {

#pragma mark - Static Background
        
        staticBackground = [SKSpriteNode spriteNodeWithImageNamed:@"USMC"];
        
        [staticBackground setPosition:CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))];
        
        [staticBackground setSize:self.size];
        
#pragma mark - Scrolling Background
        
        scrollingBackground = [SKSpriteNode spriteNodeWithImageNamed:@"Covenant"];
        
        [scrollingBackground setPosition:CGPointMake(CGRectGetMidX(self.frame), self.size.height - 55)];
        
        [scrollingBackground setSize:self.size];
        
        [scrollingBackground setScale:1.0];
        
        sexy = [SKSpriteNode spriteNodeWithImageNamed:@"Covenant"];
        
        [sexy setPosition:CGPointMake(CGRectGetMidX(self.frame) + scrollingBackground.frame.size.width, self.size.height - 55)];
        
        [sexy setSize:self.size];
        
        [sexy setScale:1.0];
        
#pragma mark - Physics
        
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:CGRectMake(scrollingBackground.frame.size.width, self.position.y + 100, self.frame.size.width, self.frame.size.height)];
        
        self.physicsWorld.gravity = CGVectorMake(0.0, -1.5);
        
#pragma mark - WeaponList
        weapons = [[NSMutableArray alloc]init];
        
        [weapons addObject:[[Weapon alloc]initWeaponNamed:@"Pistol"]];
        [weapons addObject:[[Weapon alloc]initWeaponNamed:@"RocketLauncher"]];
        [weapons addObject:[[Weapon alloc]initWeaponNamed:@"BruteShot"]];
        [weapons addObject:[[Weapon alloc]initWeaponNamed:@"AR"]];
    }
    
    return self;
    
}

- (void)didMoveToView: (SKView *) view {
    
    if (!self.contentCreated) {
        
        [self createSceneContents];
        
        self.contentCreated = YES;
    }
}


#pragma mark - Content Creation

- (void)createSceneContents {
    
    [self addChild:staticBackground];
    
    [self addChild:scrollingBackground];
    
    [self addChild:sexy];
    
#pragma mark - Chief Setup
    
    chief = [[Chief alloc] initChiefAtPosition:CGPointMake(20, self.size.height / 3 + 7.5)];
    
    [self addChild:chief];
    
}


#pragma mark - Touched

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInNode:self];
    
    [chief pickUpWeapon:weapons[2]];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
}

#pragma mark - Update

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
    
    [chief setScale:1.0];
    
    if(scrollingBackground.frame.origin.x + scrollingBackground.frame.size.width < 0)
        [scrollingBackground setPosition:CGPointMake(800, scrollingBackground.position.y)];
    else
        [scrollingBackground setPosition:CGPointMake(scrollingBackground.position.x - 1, scrollingBackground.position.y)];
    
    if(sexy.frame.origin.x + sexy.frame.size.width < 0)
        [sexy setPosition:CGPointMake(800, sexy.position.y)];
    else
        [sexy setPosition:CGPointMake(sexy.position.x - 1, sexy.position.y)];

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
