//
//  MyScene.m
//  4physicsBodys_Linked_By_RopeJoint
//
//  Created by YG on 2/17/14.
//  Copyright (c) 2014 YuryGitman. All rights reserved.
//


#import "MyScene.h"

@interface MyScene()
@property SKShapeNode* myHead1;
@property SKSpriteNode* myBody;
@property SKSpriteNode* myLeftArm;
@property SKSpriteNode* myRightArm;

@property SKSpriteNode* mySquare1;
@property SKSpriteNode* mySquare2;
@property SKSpriteNode* mySquare3;
@property SKSpriteNode* mySquare4;
@property SKSpriteNode* myShelf;


@property SKPhysicsJoint* myNeck;


@property SKPhysicsJoint* myWaist;
@property SKPhysicsJoint* myRopeJoint;
@property SKPhysicsJoint* myRopeJoint1;
@property SKPhysicsJoint* myRopeJoint2;

@end

@implementation MyScene

-(void) activateJointRope{
    
    
    _myNeck = [SKPhysicsJointPin jointWithBodyA:_myHead1.physicsBody bodyB:_myBody.physicsBody anchor: _myHead1.position];
    
    [self.physicsWorld addJoint:_myNeck];
    
    
    _myWaist = [SKPhysicsJointLimit jointWithBodyA:_myBody.physicsBody bodyB:_mySquare1.physicsBody anchorA:_myBody.position anchorB:_mySquare1.position];
    
    [self.physicsWorld addJoint:_myWaist];
    
    
    _myRopeJoint = [SKPhysicsJointLimit jointWithBodyA:_mySquare1.physicsBody bodyB:_mySquare2.physicsBody anchorA:_mySquare1.position anchorB:_mySquare2.position];
    
    [self.physicsWorld addJoint:_myRopeJoint];
    
    _myRopeJoint1 = [SKPhysicsJointLimit jointWithBodyA:_mySquare2.physicsBody bodyB:_mySquare3.physicsBody anchorA:_mySquare2.position anchorB:_mySquare3.position];
    
    [self.physicsWorld addJoint:_myRopeJoint1];
    
    
    _myRopeJoint2 = [SKPhysicsJointLimit jointWithBodyA:_mySquare3.physicsBody bodyB:_mySquare4.physicsBody anchorA:_mySquare3.position anchorB:_mySquare4.position];
    
    [self.physicsWorld addJoint:_myRopeJoint2];
    
}

-(void) spawnSquares{
    
    //_myHead1 =[[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(70, 70)];
    
    _myHead1 = [SKShapeNode node];
    
    CGMutablePathRef myPath = CGPathCreateMutable();
    CGPathAddArc(myPath, NULL, 0,0, 30, 0, M_PI*2, YES);
    _myHead1.path = myPath;
    _myHead1.fillColor = [SKColor yellowColor];
    _myHead1.strokeColor = [SKColor yellowColor];
    _myHead1.position = CGPointMake(250, 300);
    
    _myHead1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:CGSizeMake(60, 60)];
    [self addChild:_myHead1];
    
    _myBody =[[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(60, 100)];
    [_myBody setPosition:CGPointMake(250,220)];
    
    _myBody.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myBody.size];
    [self addChild:_myBody];
    
    _mySquare1 =[[SKSpriteNode alloc]initWithColor:[SKColor redColor] size:CGSizeMake(70, 70)];
    _mySquare2 =[[SKSpriteNode alloc]initWithColor:[SKColor purpleColor] size:CGSizeMake(70, 70)];
    _mySquare3 =[[SKSpriteNode alloc]initWithColor:[SKColor orangeColor] size:CGSizeMake(70, 70)];
    _mySquare4 =[[SKSpriteNode alloc]initWithColor:[SKColor yellowColor] size:CGSizeMake(70, 70)];
    
    
    [_mySquare1 setPosition:CGPointMake(self.size.width/1.5, self.size.height/1.5)];
    [_mySquare2 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2)];
    [_mySquare3 setPosition:CGPointMake(self.size.width/1.5, self.size.height/2.5)];
    [_mySquare4 setPosition:CGPointMake(self.size.width/1.5, self.size.height/3)];
    
    _mySquare1.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare1.size];
    _mySquare2.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare2.size];
    _mySquare3.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare3.size];
    _mySquare4.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_mySquare4.size];
    
    [_myHead1.physicsBody setRestitution:1.0];
    
    [_myBody.physicsBody setRestitution:1.0];

    [_mySquare1.physicsBody setRestitution:1.0];
    [_mySquare2.physicsBody setRestitution:1.0];
    [_mySquare3.physicsBody setRestitution:1.0];
    [_mySquare4.physicsBody setRestitution:1.0];
    
    [self addChild:_mySquare1];
    [self addChild:_mySquare2];
    [self addChild:_mySquare3];
    [self addChild:_mySquare4];
    
}

-(void)makeShelf{
    _myShelf = [[SKSpriteNode alloc]initWithColor:[SKColor lightGrayColor] size:CGSizeMake(100, 40)];
    _myShelf.position = CGPointMake(self.size.width/2.4, self.size.height/2);
    _myShelf.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:_myShelf.size];
    [_myShelf.physicsBody setDynamic:NO];
    
    //[self addChild:_myShelf];
    
}

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        self.scaleMode = SKSceneScaleModeAspectFit;
        self.physicsBody = [SKPhysicsBody bodyWithEdgeLoopFromRect:self.frame];
        [self.physicsBody setRestitution:1];
        
        
        [self spawnSquares];
        
        [self activateJointRope];
        [self makeShelf];
        
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    if (_myHead1.physicsBody.dynamic) {
        
        [_myHead1.physicsBody setDynamic:NO];
    }
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_myHead1 setPosition:location];
        
        
        // [_mySquare1.physicsBody setDynamic:NO];
        //  [_mySquare2.physicsBody setDynamic:NO];
        
    }
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        [_myHead1 setPosition:location];
        
    }
}

-(void) touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event  {
    
    if (!_myHead1.physicsBody.dynamic) {
        [_myHead1.physicsBody setDynamic:YES];
    }
    //  [_mySquare1.physicsBody setDynamic:YES];
    //  [_mySquare2.physicsBody setDynamic:YES];
    
}

-(void) touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{
    
    if (!_myHead1.physicsBody.dynamic) {
        [_myHead1.physicsBody setDynamic:YES];
    }
    //  [_mySquare1.physicsBody setDynamic:YES];
    //  [_mySquare2.physicsBody setDynamic:YES];
    
}


-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
