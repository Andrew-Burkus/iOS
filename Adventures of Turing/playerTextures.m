//
//  playerSKSpriteNode.m
//  Adventures of Turing
//
//  Created by iD Student on 6/11/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "playerTextures.h"

@interface playerTextures ()

@property (readonly) NSString *name;

@end

@implementation playerTextures

- (id)initPlayerTextures {
    
    if([super init]) {
        
        self.crouchTextures = @[
        [SKTexture textureWithImageNamed:@"Crouch1"],
        [SKTexture textureWithImageNamed:@"Crouch2"],
        [SKTexture textureWithImageNamed:@"Crouch3"],
        [SKTexture textureWithImageNamed:@"Crouch4"],
        [SKTexture textureWithImageNamed:@"Crouch5"],
        [SKTexture textureWithImageNamed:@"Crouch6"],
        [SKTexture textureWithImageNamed:@"Crouch7"],
        [SKTexture textureWithImageNamed:@"Crouch8"],
        [SKTexture textureWithImageNamed:@"Crouch9"],
        [SKTexture textureWithImageNamed:@"Crouch10"],
        [SKTexture textureWithImageNamed:@"Crouch11"],
        [SKTexture textureWithImageNamed:@"Crouch12"],
        [SKTexture textureWithImageNamed:@"Crouch13"],
        [SKTexture textureWithImageNamed:@"Crouch14"]
                            ];
        
        self.runningTextures = @[
        [SKTexture textureWithImageNamed:@"Run1"],
        [SKTexture textureWithImageNamed:@"Run2"],
        [SKTexture textureWithImageNamed:@"Run3"],
        [SKTexture textureWithImageNamed:@"Run4"],
        [SKTexture textureWithImageNamed:@"Run5"],
        [SKTexture textureWithImageNamed:@"Run6"],
        [SKTexture textureWithImageNamed:@"Run7"],
        [SKTexture textureWithImageNamed:@"Run8"]
                                   ];
        
        
        self.walkingTextures = @[
        [SKTexture textureWithImageNamed:@"walk1"],
        [SKTexture textureWithImageNamed:@"walk2"],
        [SKTexture textureWithImageNamed:@"walk3"]
                                    ];
        
        self.idleTextures = @[
        [SKTexture textureWithImageNamed:@"Idle1"],
        [SKTexture textureWithImageNamed:@"Idle2"],
        [SKTexture textureWithImageNamed:@"Idle3"],
        [SKTexture textureWithImageNamed:@"Idle4"],
        [SKTexture textureWithImageNamed:@"Idle5"],
        [SKTexture textureWithImageNamed:@"Idle6"],
        [SKTexture textureWithImageNamed:@"Idle7"],
        [SKTexture textureWithImageNamed:@"Idle8"],
                            ];
        
        self.joyStickLeftTextures = @[
        [SKTexture textureWithImageNamed:@"JoyStickLeft1"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft2"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft3"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft4"],
                                    ];
        
        self.joyStickRightTextures = @[
        [SKTexture textureWithImageNamed:@"JoyStickRight1"],
        [SKTexture textureWithImageNamed:@"JoyStickRight2"],
        [SKTexture textureWithImageNamed:@"JoyStickRight3"],
                                      ];
        
        self.BButtonTextures = @[
        [SKTexture textureWithImageNamed:@"BButtonDown1"],
        [SKTexture textureWithImageNamed:@"BButtonDown2"],
        [SKTexture textureWithImageNamed:@"BButtonDown3"],
        [SKTexture textureWithImageNamed:@"BButtonDown4"],
                                ];
        
        self.AButtonTextures = @[
        [SKTexture textureWithImageNamed:@"AButtonDown1"],
        [SKTexture textureWithImageNamed:@"AButtonDown2"],
        [SKTexture textureWithImageNamed:@"AButtonDown3"],
        [SKTexture textureWithImageNamed:@"AButtonDown4"]
                                ];
        
        self.footSoldierAttackTextures = @[];
        
        self.footSoldierWalkTextures = @[];
        
        self.footSoldierDeathTextures = @[];
        
        self.vehicleTextures = @[];
        
        self.vehicleDeathTextures = @[];
        
        self.grenadeTextures = @[
        [SKTexture textureWithImageNamed:@"Grenade1"],
        [SKTexture textureWithImageNamed:@"Grenade2"],
        [SKTexture textureWithImageNamed:@"Grenade3"],
        [SKTexture textureWithImageNamed:@"Grenade4"],
        [SKTexture textureWithImageNamed:@"Grenade5"],
        [SKTexture textureWithImageNamed:@"Grenade6"],
        [SKTexture textureWithImageNamed:@"Grenade7"],
        [SKTexture textureWithImageNamed:@"Grenade8"],
        [SKTexture textureWithImageNamed:@"Grenade9"],
                                 ];
        
        self.throwingTextures = @[
        [SKTexture textureWithImageNamed:@"Throw1"],
        [SKTexture textureWithImageNamed:@"Throw2"],
        [SKTexture textureWithImageNamed:@"Throw3"],
        [SKTexture textureWithImageNamed:@"Throw4"],
        [SKTexture textureWithImageNamed:@"Throw5"],
        [SKTexture textureWithImageNamed:@"Throw6"]
                                  ];
        
    }
    
    return self;
    
}

@end
