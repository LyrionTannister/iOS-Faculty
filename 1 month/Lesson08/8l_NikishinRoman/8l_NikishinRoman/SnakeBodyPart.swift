//
//  SnakeBodyPart.swift
//  8l_NikishinRoman
//
//  Created by Admin on 10.03.2020.
//  Copyright © 2020 Roman Nikishin. All rights reserved.
//

import SpriteKit

class SnakeBodyPart: SKShapeNode {
    init(atPoint point: CGPoint) {
        super.init()
        
        path = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: 12, height: 16), cornerRadius: 4).cgPath
        
        
        fillColor = .brown
        strokeColor = .yellow
        
        lineWidth = 3
        
        self.position = point
        
        self.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 8, height: 12))
        self.physicsBody?.isDynamic = true
        self.physicsBody?.categoryBitMask = CollisionCategories.Snake
        self.physicsBody?.contactTestBitMask = CollisionCategories.EdgeOfScene | CollisionCategories.Apple
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
