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

@property (nonatomic, strong) NSArray *jumpTextures;

@property (nonatomic, strong) NSArray *runForwardTextures;

@property (nonatomic, strong) NSArray *runBackwardTextures;

@property (nonatomic, strong) NSArray *idleTextures;

@property (nonatomic, strong) NSArray *joyStickLeftTextures;

@property (nonatomic, strong) NSArray *joyStickRightTextures;

@end
