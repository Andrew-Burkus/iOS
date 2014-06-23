//
//  KillCounter.m
//  Adventures of Turing
//
//  Created by iD Student on 6/18/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "KillCounter.h"

@implementation KillCounter {
    NSNumber *count;
    
}

- (id)initKillCounterAtPosition:(CGPoint)point {
    
    if([super initWithImageNamed:@"0"]) {
        [self setPosition:point];
        [self setScale:0.1];
        count = 0;
    }
    
    return self;
}

- (void)increment {
    NSNumber *nextNum = [NSNumber numberWithInt:[count intValue] + 1];
    count = nextNum;
    NSString *new = [NSString stringWithFormat:@"%@",[nextNum stringValue]];
    SKTexture *next = [SKTexture textureWithImageNamed:new];
    [self setTexture:next];
}

- (int)getCount {
    return [count intValue];
}

- (void)reset {
    NSNumber *zero = [NSNumber numberWithInt:0];
    
    count = zero;
}

@end
