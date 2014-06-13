//
//  playerSKSpriteNode.m
//  Adventures of Turing
//
//  Created by iD Student on 6/11/14.
//  Copyright (c) 2014 Andrew-Burkus. All rights reserved.
//

#import "playerNode.h"

@interface playerNode ()

@property (nonatomic, strong) NSArray *runForwardTextures;

@property (nonatomic, strong) NSArray *runBackwardTextures;

@property (nonatomic, strong) NSArray *idleTextures;

@property (readonly) NSString *name;

@end

@implementation playerNode

- (id)initPlayerWithImage:(NSString *)imageName andName:(NSString *)name {
    
    if([super initWithImage:imageName]) {
        self.name = name;
        
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
        
  //      self.jump = [SKAction group: @[
    //    [SKAction animateWithTextures:self.jumpTextures timePerFrame:0.033],
      //  [SKAction moveToY:(self.position.y + 50.0) duration:0.33]
        //] ];

        self.runForward = [SKAction animateWithTextures:self.runForwardTextures timePerFrame:0.033];
        
        self.runBackward = [SKAction animateWithTextures:self.runBackwardTextures timePerFrame:0.033];
        
        self.idle = [SKAction animateWithTextures:self.idleTextures timePerFrame:0.033];
        
    }
    
    return self;
    
}

- (void)jumps {
    
    //[self runAction:self.jump];
}

- (void)runsForward {
    
    
}

- (void)runsBackward {
    
    
}

- (void)idles {


}

@end
