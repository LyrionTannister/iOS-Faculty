//
//  Snake.swift
//  8l_NikishinRoman
//
//  Created by Admin on 10.03.2020.
//  Copyright © 2020 Roman Nikishin. All rights reserved.
//

import SpriteKit

class Snake: SKShapeNode {
    
    var moveSpeed: CGFloat = 90.0
    var angle: CGFloat = 0.0
    
    var body = [SnakeBodyPart]()
    
    convenience init(atPoint point: CGPoint) {
        self.init()
        
        let head = SnakeHead(atPoint: point)
        body.append(head)
        addChild(head)
        
        addBodyPart()
    }
    
    func addBodyPart() {
        let newBodyPart = SnakeBodyPart(atPoint: CGPoint(x: body.last!.position.x,
                                                         y: body.last!.position.y - 8))
        body.append(newBodyPart)
        addChild(newBodyPart)
    }
    
    func move() {
        guard !body.isEmpty else { return }
        
        let head = body[0]
        moveHead(head)
        
        for index in 0..<body.count where index > 0 {
            let prevPart = body[index - 1]
            let currPart = body[index]
            moveBodyPart(prevPart, current: currPart)
        }
    }
    
    func moveHead(_ head: SnakeBodyPart) {
        let dx = moveSpeed * sin(angle)
        let dy = moveSpeed * cos(angle)
        
        let nextPosition = CGPoint(x: head.position.x + dx, y: head.position.y + dy)
        let moveAction = SKAction.move(to: nextPosition, duration: 0.9)
        head.run(moveAction)
    }
    
    func moveBodyPart(_ previous: SnakeBodyPart, current: SnakeBodyPart) {
        let moveAction = SKAction.move(to: CGPoint(x: previous.position.x, y: previous.position.y), duration: 0.1)
        current.run(moveAction)
    }
    
    func moveClockwise() {
        angle += .pi / 2
    }
    
    func moveCounterClockwise() {
        angle -= .pi / 2
    }
}
