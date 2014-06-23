//
//  Grunt.h
//  RetroHalo
//
//  Created by iD Student on 6/18/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@interface Grunt : SKSpriteNode

-(id)initGruntAtPosition:(CGPoint)point;

@property SKAction *run;

@property SKAction *remove;

@property NSMutableArray *flail;

@property SKAction *die;

-(BOOL)isTouched;

@end
