//
//  player.m
//  Adventures of Turing
//
//  Created by iD Student on 6/10/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "Character.h"

@interface Character ()

@property NSNumber * DEFAULT_DAMAGE;

@property CGVector DEFAULT_RUNNING_VELOCITY;

@property SKAction * DEFAULT_MOVE_RIGHT;

@property SKAction * DEFAULT_MOVE_LEFT;

@property SKAction * DEFAULT_JUMP;

@property SKAction * DEFAULT_ATTACK;

@end

@implementation Character

-(id) initWithImage:(NSString *) name {
    
    self = [super initWithImageNamed:name];
    
    if(self) {
        
        [self setScale:0.5];
        
    #pragma - mark "Physics init"
        
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        
        self.physicsBody.dynamic = YES;
        
        self.physicsBody.affectedByGravity = YES;
        
    #pragma - mark "Default Values"
        
        self.DEFAULT_DAMAGE = [NSNumber numberWithInt:33];
        
        self.DEFAULT_RUNNING_VELOCITY = CGVectorMake(10.0, 0.0);
        
        self.DEFAULT_MOVE_RIGHT = [SKAction moveBy:self.DEFAULT_RUNNING_VELOCITY duration:0.2];
        
        self.DEFAULT_MOVE_LEFT = [SKAction moveBy:CGVectorMake(-10.0, 0.0) duration:0.2];
        
        self.DEFAULT_JUMP = [SKAction moveBy:CGVectorMake(0.0, 20.0) duration:0.2];
        
    }
    
    return self;
}

- (BOOL)hasHit:(Character *)other {
    return true;
}

- (BOOL)isTouchingBorder:(SKScene *)scene {
    return true;
}

- (int)isInSection:(SKScene *)scene {
    return 0;
}

@end
