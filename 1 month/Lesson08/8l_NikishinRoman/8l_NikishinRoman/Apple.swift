//
//  Apple.swift
//  8l_NikishinRoman
//
//  Created by Admin on 10.03.2020.
//  Copyright © 2020 Roman Nikishin. All rights reserved.
//

import SpriteKit

class Apple: SKShapeNode {
    convenience init(position: CGPoint) {
        self.init()
        
        path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: 16, height: 16)).cgPath
        
        fillColor = .red
        strokeColor = .green
        
        lineWidth = 4
        
        self.position = position
        
        self.physicsBody = SKPhysicsBody(circleOfRadius: 8, center: CGPoint(x: 8, y: 8))
        self.physicsBody?.categoryBitMask = CollisionCategories.Apple
    }
}
