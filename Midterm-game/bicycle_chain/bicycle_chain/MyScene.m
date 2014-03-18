//
//  MyScene.m
//  SpriteKitPhysicsTest
//
//  Created by Main Account on 8/30/13.
//  Copyright (c) 2013 Razeware LLC. All rights reserved.
//

#import "MyScene.h"

@implementation MyScene
{
    SKSpriteNode *_chain;
    SKSpriteNode *_chain2;
    SKSpriteNode *_chain3;
    SKSpriteNode *_chain4;
    SKSpriteNode *_chain5;
    SKPhysicsJoint *_joint0;
    SKPhysicsJoint *_joint1;
    SKPhysicsJoint *_joint2;
    SKPhysicsJoint *_joint3;
    SKPhysicsJoint *_joint4;
    
    SKSpriteNode *_loose_chain;
}

-(instancetype)initWithSize:(CGSize)size
{
    if(self = [super initWithSize:size])
    {
        
        self.backgroundColor = [SKColor whiteColor];
        
        self.physicsBody =
        [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        
        [self.physicsBody setRestitution:1];
        
        _chain = [SKSpriteNode spriteNodeWithImageNamed:@"chain"];
        _chain.position = CGPointMake(_chain.size.width * 1/2,
                                      _chain.size.height * 1/2 + self.size.height/2);
        
        _chain.physicsBody =
        [SKPhysicsBody bodyWithRectangleOfSize:_chain.size];
        
        [_chain.physicsBody setRestitution:1.0];
        [self addChild:_chain];
        
//        
//        //1
//        CGMutablePathRef chainPath = CGPathCreateMutable();
//        
//        //2
//        CGPathMoveToPoint(
//                          chainPath, nil, -_chain.size.width/2, -_chain.size.height/2);
//        
//        //3
//        CGPathAddLineToPoint(
//                             chainPath, nil, _chain.size.width/2, -_chain.size.height/2);
//        CGPathAddLineToPoint(chainPath, nil, 0, _chain.size.height/2);
//        CGPathAddLineToPoint(
//                             chainPath, nil, -_chain.size.width/2, -_chain.size.height/2);
//        
        //4
//        _chain.physicsBody =
//        [SKPhysicsBody bodyWithPolygonFromPath:chainPath];
        
        
        //5
//        CGPathRelease(chainPath);
        
        _chain2 = [SKSpriteNode spriteNodeWithImageNamed:@"chain"];
        _chain2.position = CGPointMake(_chain.position.x + _chain.size.width*7/12,
                                       _chain.position.y);
        _chain2.physicsBody =
        [SKPhysicsBody bodyWithRectangleOfSize:_chain2.size];
        [_chain2.physicsBody setRestitution:1.0];
        [self addChild:_chain2];
        
        
        _chain3 = [SKSpriteNode spriteNodeWithImageNamed:@"chain"];
        _chain3.position = CGPointMake(_chain2.position.x + _chain2.size.width*7/12,
                                       _chain2.position.y);
        _chain3.physicsBody =
        [SKPhysicsBody bodyWithRectangleOfSize:_chain3.size];
        [_chain3.physicsBody setRestitution:1.0];
        [self addChild:_chain3];
        
        
        _chain4 = [SKSpriteNode spriteNodeWithImageNamed:@"chain"];
        _chain4.position = CGPointMake(_chain3.position.x + _chain3.size.width*7/12,
                                       _chain3.position.y);
        _chain4.physicsBody =
        [SKPhysicsBody bodyWithRectangleOfSize:_chain4.size];
        [_chain4.physicsBody setRestitution:1.0];
        [self addChild:_chain4];
        
        
        
        _chain5 = [SKSpriteNode spriteNodeWithImageNamed:@"chain"];
        _chain5.position = CGPointMake(_chain4.position.x + _chain4.size.width*7/12,
                                       _chain4.position.y);
        _chain5.physicsBody =
        [SKPhysicsBody bodyWithRectangleOfSize:_chain5.size];
        [_chain5.physicsBody setRestitution:1.0];
        [self addChild:_chain5];
        
        
        _loose_chain = [SKSpriteNode spriteNodeWithImageNamed:@"chain"];
        _loose_chain.position = CGPointMake(self.size.width - _loose_chain.size.width,
                                       self.size.height/2);
        _loose_chain.physicsBody =
        [SKPhysicsBody bodyWithRectangleOfSize:_loose_chain.size];
        [_loose_chain.physicsBody setRestitution:1.0];
        [self addChild:_loose_chain];
        
        _joint0 = [SKPhysicsJointPin jointWithBodyA:self.physicsBody bodyB:_chain.physicsBody anchor:
                   CGPointMake(0,
                               _chain.position.y)];
                               
        _joint1 = [SKPhysicsJointPin jointWithBodyA:_chain.physicsBody bodyB:_chain2.physicsBody anchor:
                   CGPointMake(_chain2.position.x - _chain2.size.width*7/24,
                               _chain2.position.y)];
        
        _joint2 = [SKPhysicsJointPin jointWithBodyA:_chain2.physicsBody bodyB:_chain3.physicsBody anchor:
                   CGPointMake(_chain3.position.x - _chain3.size.width*7/24,
                                _chain3.position.y)];
        
        _joint3 = [SKPhysicsJointPin jointWithBodyA:_chain3.physicsBody bodyB:_chain4.physicsBody anchor:
                   CGPointMake(_chain4.position.x - _chain4.size.width*7/24,
                               _chain4.position.y)];
        
        _joint4 = [SKPhysicsJointPin jointWithBodyA:_chain4.physicsBody bodyB:_chain5.physicsBody anchor:
                   CGPointMake(_chain5.position.x - _chain5.size.width*7/24,
                               _chain5.position.y)];
        
        [self.physicsWorld addJoint:_joint0];
        [self.physicsWorld addJoint:_joint1];
        [self.physicsWorld addJoint:_joint2];
        [self.physicsWorld addJoint:_joint3];
        [self.physicsWorld addJoint:_joint4];
        
    }
    return self;
}



- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    if (_chain5.physicsBody.dynamic) {
        
        [_chain5.physicsBody setDynamic:NO];
    }
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_chain5 setPosition:location];
    }

}


-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_chain5 setPosition:location];
        
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    if (!_chain5.physicsBody.dynamic) {
        [_chain5.physicsBody setDynamic:YES];
    }
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!_chain5.physicsBody.dynamic) {
        [_chain5.physicsBody setDynamic:YES];
    }
    
}


@end
