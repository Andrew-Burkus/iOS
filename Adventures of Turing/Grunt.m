//
//  Grunt.m
//  RetroHalo
//
//  Created by iD Student on 6/18/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "Grunt.h"
@interface Grunt ()

@end

@implementation Grunt {
    BOOL touched;
}

-(id)initGruntAtPosition:(CGPoint)point {
    if([super initWithImageNamed:@"DefaultGrunt"]) {
        [self setPosition:point];
        
        //[self setUserInteractionEnabled:YES];
        
        SKAction *first = [SKAction animateWithTextures:
                           [self loadAnimationFor:@"Death" withFrames:5] timePerFrame:0.1];
        
        SKAction *second = [SKAction fadeOutWithDuration:0.09];
        
        self.die = [SKAction sequence:@[first, second]];
        
        self.flail = [self loadAnimationFor:@"GruntFlail" withFrames:19];
        
        touched = false;
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    touched = true;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    touched = false;
}

-(BOOL)isTouched {
    return touched;
}


- (NSMutableArray *)loadAnimationFor:(NSString *)name withFrames:(int)frames {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(int i = 1; i <= frames; i++) {
        NSString *frameName = [NSMutableString stringWithFormat:@"%@%d", name, i];
        
        SKTexture *frameToLoad = [SKTexture textureWithImageNamed:frameName];
        if(frameToLoad)
            [array addObject:frameToLoad];
    }
    return array;
}


@end
