//
//  Weapon.m
//  Adventures of Turing
//
//  Created by iD Student on 6/17/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "Weapon.h"

@interface Weapon ()

@end

@implementation Weapon {
    int frameCount;
}

- (id)initWeaponNamed:(NSString *)name {
    if([super initWithImageNamed:name]) {
        self.name = name;
        
    }
    return self;
}

- (void)animate {
    NSArray *textures = [self loadAnimationFor:self.name withFrames:frameCount];
    
    SKAction *first = [SKAction animateWithTextures:textures timePerFrame:0.033];
    SKAction *second = [SKAction repeatActionForever:first];
    [self runAction:second];
}

- (NSMutableArray *)loadAnimationFor:(NSString *)name withFrames:(int)frames {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for(int i = 1; i <= frames; i++) {
        NSString *frameName = [NSMutableString stringWithFormat:@"%@%@%d", name, @"Burst", i];
        
        SKTexture *frameToLoad = [SKTexture textureWithImageNamed:frameName];
        if(frameToLoad)
            [array addObject:frameToLoad];
    }
    return array;
}


@end
