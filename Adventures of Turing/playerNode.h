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

@interface playerNode : Character

- (id)initPlayerWithImage:(NSString *)imageName andName:(NSString *)name;

@property (nonatomic, strong) NSArray *jumpTextures;

@property (strong, nonatomic) SKAction *runForward;

@property (strong, nonatomic) SKAction *runBackward;

@property (strong, nonatomic) SKAction *idle;

@end
