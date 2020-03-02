//
//  main.swift
//  homework06
//
//  Created by Admin on 02.03.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

import Foundation

protocol Exercise {
    var level: Int {get}
    var time: Int {get}
}

extension Exercise {
    var description: String {
        "Difficulty level is \(level), time to complete: \(time)"
    }
}

struct Swimming: Exercise {
    var speed: Int
    var time: Int
    var level: Int
        
    func printDesctiption() {
        print("Time to complete: \(time), with speed: \(speed)")
    }
}

struct Running: Exercise {
    var angle: Int
    var time: Int
    var level: Int
    
    func printDesctiption() {
        print("Difficulty level is \(level), time to complete: \(time), hill angle: \(angle)")
    }
}

struct Stack<E: Exercise> {
    private var elements: [E] = []
    
    mutating func push(_ element: E){
        elements.append(element)
    }
    
    mutating func pop() -> E? {
        guard elements.isEmpty == false else { return nil }
        return elements.removeLast()
    }
    
    subscript(elements: Int...) -> Int {
        elements.reduce(0) {$0 + self.elements[$1].time}
    }
}

var runningStack = Stack<Running>()
func testAll() {
runningStack.push(Running(angle: 1, time: 100, level: 2))
runningStack.push(Running(angle: 3, time: 200, level: 4))
runningStack.push(Running(angle: 0, time: 300, level: 1))

print(runningStack[0,2])

print(runningStack.pop()!)
print(runningStack.pop()!)

var swimmingStack = Stack<Swimming>()
swimmingStack.push(Swimming(speed: 5, time: 400, level: 3))
print(swimmingStack.pop()!)
}
