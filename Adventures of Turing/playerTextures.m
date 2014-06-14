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
        
        self.jumpTextures = @[ \
        [SKTexture textureWithImageNamed:@"jump1"],
        [SKTexture textureWithImageNamed:@"jump2"],
        [SKTexture textureWithImageNamed:@"jump3"], 
        [SKTexture textureWithImageNamed:@"jump4"],
        [SKTexture textureWithImageNamed:@"jump5"],
        [SKTexture textureWithImageNamed:@"jump6"],
        [SKTexture textureWithImageNamed:@"jump7"],
        [SKTexture textureWithImageNamed:@"jump8"],
        [SKTexture textureWithImageNamed:@"jump9"],
        [SKTexture textureWithImageNamed:@"jump10"]
        ];
        
        self.runForwardTextures = @[
        [SKTexture textureWithImageNamed:@"run1"],
        [SKTexture textureWithImageNamed:@"run2"],
        [SKTexture textureWithImageNamed:@"run3"],
        [SKTexture textureWithImageNamed:@"run4"],
        [SKTexture textureWithImageNamed:@"run5"],
        [SKTexture textureWithImageNamed:@"run6"],
        [SKTexture textureWithImageNamed:@"run7"],
        [SKTexture textureWithImageNamed:@"run8"],
        [SKTexture textureWithImageNamed:@"run9"],
        [SKTexture textureWithImageNamed:@"run10"],
        [SKTexture textureWithImageNamed:@"run11"],
        [SKTexture textureWithImageNamed:@"run12"]
        ];
        
        
        self.runBackwardTextures = @[
        [SKTexture textureWithImageNamed:@"backward1"],
        [SKTexture textureWithImageNamed:@"backward2"],
        [SKTexture textureWithImageNamed:@"backward3"],
        [SKTexture textureWithImageNamed:@"backward4"],
        [SKTexture textureWithImageNamed:@"backward5"],
        [SKTexture textureWithImageNamed:@"backward6"],
        [SKTexture textureWithImageNamed:@"backward7"]
        ];
        
        self.idleTextures = @[
        [SKTexture textureWithImageNamed:@"idle1"],
        [SKTexture textureWithImageNamed:@"idle2"],
        [SKTexture textureWithImageNamed:@"idle3"],
        [SKTexture textureWithImageNamed:@"idle4"],
        ];
        
        self.joyStickLeftTextures = @[
        [SKTexture textureWithImageNamed:@"JoyStickLeft1"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft1"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft2"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft2"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft3"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft3"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft4"],
        [SKTexture textureWithImageNamed:@"JoyStickLeft4"],
                                    ];
        
        self.joyStickRightTextures = @[
        [SKTexture textureWithImageNamed:@"JoyStickRight1"],
        [SKTexture textureWithImageNamed:@"JoyStickRight1"],
        [SKTexture textureWithImageNamed:@"JoyStickRight2"],
        [SKTexture textureWithImageNamed:@"JoyStickRight2"],
        [SKTexture textureWithImageNamed:@"JoyStickRight3"],
        [SKTexture textureWithImageNamed:@"JoyStickRight3"],
                                      ];
        
    }
    
    return self;
    
}

@end
