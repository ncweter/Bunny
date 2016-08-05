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
    override func didMoveToView(view: SKView) {
        /* Set up your scene here */
        
        /* Recursive node search for 'hero' (child of referenced node) */
        hero = self.childNodeWithName("//hero") as! SKSpriteNode
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        /* Apply vertical impulse */
        hero.physicsBody?.applyImpulse(CGVectorMake(0, 250))
    }
    
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}