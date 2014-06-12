//
//  obstacleSpriteNode.m
//  Adventures of Turing
//
//  Created by iD Student on 6/11/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "floorNode.h"

@interface floorNode ()

@end


@implementation floorNode

- (id)initWithImage:(NSString *) name {
    self = [super initWithImageNamed:name];
    
    if(self) {
        
        self.floorCategory = 0x1 << 1;
        
        [self setScale:0.5];
        
    #pragma - mark "Physics defaults"
        
        self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
        
        self.physicsBody.dynamic = NO;
        
        self.physicsBody.contactTestBitMask = self.floorCategory;
        
        self.physicsBody.collisionBitMask = 0;
        
        self.physicsBody.mass = 100;
        
        self.physicsBody.usesPreciseCollisionDetection = YES;
        
        self.physicsBody.affectedByGravity = NO;
        
    }
    
    return self;
}

@end
