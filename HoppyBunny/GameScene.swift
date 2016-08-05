//
//  GameScene.swift
//  HoppyBunny
//
//  Created by  Max Wu on 2016/8/5.
//  Copyright (c) 2016年 Nicole Weter. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var hero: SKSpriteNode!
    var sinceTouch : CFTimeInterval = 0
    let fixedDelta: CFTimeInterval = 1.0/60.0 /* 60 FPS */
    
    override func didMoveToView(view: SKView) {
        /* Set up your scene here */
        
        /* Recursive node search for 'hero' (child of referenced node) */
        hero = self.childNodeWithName("//hero") as! SKSpriteNode
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        /* Apply vertical impulse */
        hero.physicsBody?.applyImpulse(CGVectorMake(0, 250))
        
        /* Play SFX */
        let flapSFX = SKAction.playSoundFileNamed("sfx_flap", waitForCompletion: false)
        self.runAction(flapSFX)
        
        /* Apply subtle rotation */
        hero.physicsBody?.applyAngularImpulse(1)
        
        /* Reset touch timer */
        sinceTouch = 0
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        /* Grab current velocity */
        let velocityY = hero.physicsBody?.velocity.dy ?? 0
        
        /* Check and cap vertical velocity */
        if velocityY > 400 {
            hero.physicsBody?.velocity.dy = 400
        }
        
        /* Apply falling rotation */
        if sinceTouch > 0.1 {
            let impulse = -20000 * fixedDelta
            hero.physicsBody?.applyAngularImpulse(CGFloat(impulse))
        }
        
        /* Clamp rotation */
        hero.zRotation.clamp(CGFloat(-20).degreesToRadians(),CGFloat(30).degreesToRadians())
        hero.physicsBody?.angularVelocity.clamp(-2, 2)
        
        /* Update last touch timer */
        sinceTouch+=fixedDelta
    }

}