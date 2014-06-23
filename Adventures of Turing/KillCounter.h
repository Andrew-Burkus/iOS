//
//  KillCounter.h
//  Adventures of Turing
//
//  Created by iD Student on 6/18/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface KillCounter : SKSpriteNode

- (id)initKillCounterAtPosition:(CGPoint)point;

- (void)increment;

- (int)getCount;

- (void)reset;

@end
