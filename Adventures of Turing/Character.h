//
//  player.h
//  Adventures of Turing
//
//  Created by iD Student on 6/10/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>
#import "floorNode.h"

@interface Character : SKSpriteNode

- (BOOL)isTouchingBorder:(SKScene *)scene;

- (BOOL)hasHit:(Character *)other;

- (int)isInSection:(SKScene *)scene;

- (id)initWithImage:(NSString *) name;

@end
