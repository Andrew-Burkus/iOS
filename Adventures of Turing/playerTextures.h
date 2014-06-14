//
//  playerSKSpriteNode.h
//  Adventures of Turing
//
//  Created by iD Student on 6/11/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "Character.h"
#import <Foundation/Foundation.h>
#import <SpriteKit/SpriteKit.h>

@interface playerTextures : SKSpriteNode

- (id)initPlayerTextures;

@property (nonatomic, strong) NSArray *crouchTextures;

@property (nonatomic, strong) NSArray *runningTextures;

@property (nonatomic, strong) NSArray *walkingTextures;

@property (nonatomic, strong) NSArray *throwingTextures;

@property (nonatomic, strong) NSArray *grenadeTextures;

@property (nonatomic, strong) NSArray *idleTextures;

@property (nonatomic, strong) NSArray *joyStickLeftTextures;

@property (nonatomic, strong) NSArray *joyStickRightTextures;

@property (nonatomic, strong) NSArray *BButtonTextures;

@property (nonatomic, strong) NSArray *AButtonTextures;

@property (nonatomic, strong) NSArray *footSoldierWalkTextures;

@property (nonatomic, strong) NSArray *footSoldierAttackTextures;

@property (nonatomic, strong) NSArray *footSoldierDeathTextures;

@property (nonatomic, strong) NSArray *vehicleTextures;

@property (nonatomic, strong) NSArray *vehicleDeathTextures;


@end
