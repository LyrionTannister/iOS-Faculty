//
//  SnakeHead.swift
//  8l_NikishinRoman
//
//  Created by Admin on 10.03.2020.
//  Copyright © 2020 Roman Nikishin. All rights reserved.
//

import SpriteKit

class SnakeHead: SnakeBodyPart {
    
    override init(atPoint point: CGPoint) {
        super.init(atPoint: point)
        
        fillColor = .black
        
        self.physicsBody?.categoryBitMask = CollisionCategories.SnakeHead
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeOfScene | CollisionCategories.Apple | CollisionCategories.Snake
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
