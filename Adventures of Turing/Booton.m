//
//  Booton.m
//  Adventures of Turing
//
//  Created by iD Student on 6/18/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "Booton.h"

@interface Booton ()

@property BOOL touched;

@end

@implementation Booton

- (id)initBootonWithImage:(NSString *)name atPosition:(CGPoint)point {
    if([super initWithImageNamed:name]) {
        [self setUserInteractionEnabled:YES];
        [self setPosition:point];
        self.touched = false;
    }
    
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    self.touched = true;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    self.touched = false;
}

- (BOOL)isTouched {
    return self.touched;
}


@end
