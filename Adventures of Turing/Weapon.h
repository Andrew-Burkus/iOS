//
//  Weapon.h
//  Adventures of Turing
//
//  Created by iD Student on 6/17/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Weapon : SKSpriteNode

- (id)initWeaponNamed:(NSString *)name;

@property (strong, nonatomic) NSString *name;

- (SKTexture *)getBulletTexture;

- (NSMutableArray *)getWeaponAnimation;

- (SKTexture *)getWeaponExplosion;

@end
