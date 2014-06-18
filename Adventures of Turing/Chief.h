//
//  Chief.h
//  Adventures of Turing
//
//  Created by iD Student on 6/16/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "Weapon.h"

@interface Chief : SKSpriteNode

@property (strong, nonatomic) NSString *currentWeapon;

-(id)initChiefAtPosition:(CGPoint)point;

-(void)pickUpWeapon:(Weapon *)weapon;

@end
