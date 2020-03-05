//
//  main.swift
//  homework06
//
//  Created by Admin on 02.03.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

protocol Discs {
    var volume: Int {get}
    var type: String {get}
}

extension Discs {
    var description: String {
        "Disc volume is \(volume), disc type is \(type)"
    }
}

struct DVD: Discs {
    var volume: Int = 4_700
    var type: String
}

struct CD: Discs {
    var volume: Int = 750
    var type: String
}

struct BlueRay: Discs {
    var volume: Int = 25_000
    var type: String
}

// 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
struct Queue<D> {
    private var elements: [D] = []
    
    mutating func addToQueue(_ element: D){
        elements.append(element)
    }
    
    mutating func removeFromQueue() -> D? {
        guard elements.isEmpty == false else { return nil }
        return elements.removeFirst()
    }
    
// 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
//    mutating func filter(type: (D) -> Bool) -> D {
//        elements.filter(_ )
//    }
    
// 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
    subscript(element index: Int) -> D? {
        index > elements.count || (index < 1) ? nil : elements[index - 1]
    }
}

var bulk = Queue<Discs>()
bulk.addToQueue(DVD(volume: 8_500, type: "DVD-R DL"))
bulk.addToQueue(CD(volume: 600, type: "CD-RW"))
bulk.addToQueue(BlueRay(volume: 50_000, type: "BD-RE DL"))

print(bulk[element: 1] ?? "No disc")
print(bulk[element: 2]!)
print(bulk[element: 3] as Any)
print(bulk[element: 4] ?? "No disc")
print(bulk[element: 0] ?? "No disc")

