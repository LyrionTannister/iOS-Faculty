//
//  main2.swift
//  5l_NikishinRoman
//
//  Created by Admin on 27.02.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

/*
import Foundation

protocol Figure {
    var sides: [Double] { get }
}

protocol PerimeterCalculatable: Figure {
    func calculate() -> Double
}

extension PerimeterCalculatable {
    var perimeter: Double { 0 }
    
    func printPerimeter(){
        print(perimeter)
    }
    
    func calculate () -> Double {
        sides.reduce(0, +)
    }
}

struct Rectanle: CustomStringConvertible, PerimeterCalculatable {
    
    var sideA: Double = 1.0
    var sideB: Double = 1.0
    
    var  sides: [Double] {
        return [sideA * 2, sideB * 2]
    }
    
    var perimeter: Double {
        return (sideA + sideB) * 2
    }
    
    var description: String {
        return ("Square with perimeter: \(perimeter)")
    }
    
    func calculate() -> Double {
        (sideA + sideB) * 2
    }
}

extension Rectanle: Equatable {
    static func == (lhs: Rectanle, rhs: Rectanle) -> Bool {
        lhs.calculateSquare() == rhs.calculateSquare()
    }
    
    func calculateSquare() -> Double {
        sideA * sideB
    }
}

var rect1 = Rectanle(sideA: 5, sideB: 10)
var rect2 = Rectanle(sideA: 10, sideB: 10)

print(rect1 == rect2)
//rect1.calculate()
print(rect1)
print(rect2)
print(rect1.calculateSquare())
print(rect2.calculateSquare())

// -------------------------------------------------------------

class Hand {
    var writingTool: WritingTool?
    
    func write(_ text:String){
        writingTool?.writeText(text)
    }
}

protocol WritingTool {
    func writeText(_ text: String)
}

class RedPen: WritingTool {
    func writeText(_ text: String){
        print("RedPen: \(text)")
    }
}
class Pen: WritingTool {
    func writeText(_ text: String){
        print("Pen: \(text)")
    }
}
class Pencil: WritingTool {
    func writeText(_ text: String){
        print("Pencil: \(text)")
    }
}
class Marker: WritingTool {
    func writeText(_ text: String){
        print("Marker: \(text)")
    }
}

let pen = Pen()
let marker = Marker()

let hand = Hand()


hand.writingTool = pen
hand.write("Text")

hand.writingTool = marker
hand.write("Next")

hand.writingTool = nil
hand.write("Sex")

class Base {
    var health = 100
}

class Tower {
    func shoot() {}
}

class Enemy {
    func move() {}
}

class EnemyShooter: Enemy {
    func shoot() {}
}

class EnemyHealthyShooter: Enemy {
    var health = 0
}

// =========================

protocol Healthable {
    var health: Int {get set}
}


protocol Movable {
    func move()
}

extension Movable {
    func move() {}
}

protocol Shootable {
    func shoot()
}

extension Shootable {
    func shoot() {}
}
// ====

class Base2: Healthable {
    var health = 1_000
}

class Tower2: Shootable {}

class Enemy2: Movable {}

class EnemyShooter2: Shootable, Movable {}

class FriendlySoldier: Healthable, Shootable, Movable {
    var health: Int = 100
}

// ====
*/
