//
//  main.swift
//  homework06
//
//  Created by Admin on 02.03.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//
/*
 
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

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
struct Queue<D: Discs> {
    private var elements: [D] = []
    
    mutating func push(_ element: D){
        elements.append(element)
    }
    
    mutating func pop() -> D? {
        guard elements.isEmpty == false else { return nil }
        return elements.removeFirst()
    }
}
