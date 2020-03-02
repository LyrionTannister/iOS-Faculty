//
//  main.swift
//  homework06
//
//  Created by Admin on 02.03.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//
/*
 1. Реализовать свой тип коллекции «очередь» (queue) c использованием дженериков.
 2. Добавить ему несколько методов высшего порядка, полезных для этой коллекции (пример: filter для массивов)
 3. * Добавить свой subscript, который будет возвращать nil в случае обращения к несуществующему индексу.
 */

struct Queue<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T){
        elements.append(element)
    }
    
    mutating func pop() -> T? {
        guard elements.isEmpty == false else { return nil }
        return elements.removeFirst()
    }
}
