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
        self.name = name;//character access
        [self setName:name];//scene access - easier to implement
        
    }
    return self;
}

- (SKTexture *)getBulletTexture {
    NSString *bully = [NSString stringWithFormat:@"%@Projectile",self.name];
    return [SKTexture textureWithImageNamed:bully];
}

- (NSMutableArray *)getWeaponAnimation {
    NSString *nem = [NSString stringWithFormat:@"%@Burst", self.name];
    return [self loadAnimationFor:nem withFrames:2];

}

- (SKTexture *)getWeaponExplosion {
    NSString *nem = [NSString stringWithFormat:@"%@Explosion", self.name];
    return [SKTexture textureWithImageNamed:nem];
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
