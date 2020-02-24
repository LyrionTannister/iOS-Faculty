//
//  main.swift
//  3l_NikishinRoman
//
//  Created by Nikishin Roman on 20.02.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

/*
 
 1. Описать несколько структур – любой легковой автомобиль и любой грузовик.
 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
 6. Вывести значения свойств экземпляров в консоль.

 */

import Foundation


enum EngineState {
    case start
    case stop
}
enum WindowsState {
    case open
    case closed
}
enum TrunkManipulations {
    // TODO Реализовать метод указания количества груза
    case load
    case unload
}

enum CarState{
    case new
    case used(odo: Int)
}

struct Car {
    var brand: String
    var model: String
    var year: Int
    var color: String
    var mileage: CarState
    var price: Int
    
    var trunkVolume: Double
    private(set) var trunkLoadedVolume: Double

    private(set) var engineState: EngineState = .stop
    private(set) var windowsState: WindowsState = .closed
    

    init(brand: String,
         model: String,
         year: Int,
         color: String,
         mileage: CarState = .new,
         price: Int,
         trunkVolume: Double
    ){
        self.brand = brand
        self.model = model
        self.year = year
        self.color = color
        self.mileage = mileage
        self.price = price
        self.trunkVolume = trunkVolume
        
        self.trunkLoadedVolume = 0.0
        self.engineState = .stop
        self.windowsState = .closed
    }

    mutating func changeEngineState(){
        if engineState == .stop {
            engineState = .start
        } else {
            engineState = .stop
        }
    }
    mutating func changeWindowsState(){
        if windowsState == .closed {
            windowsState = .open
        } else {
            windowsState = .closed
        }
    }
    mutating func manipulateWithTrunk(){
        if windowsState == .closed {
            windowsState = .open
        } else {
            windowsState = .closed
        }
    }
}
struct Truck {
    var brand: String
    var model: String
    var year: Int
    var color: String
    var mileage: CarState
    var price: Int
    
    var trunkVolume: Double
    private(set) var trunkLoadedVolume: Double

    private(set) var engineState: EngineState = .stop
    private(set) var windowsState: WindowsState = .closed
    

    init(brand: String,
         model: String,
         year: Int,
         color: String,
         mileage: CarState = .new,
         price: Int,
         trunkVolume: Double
    ){
        self.brand = brand
        self.model = model
        self.year = year
        self.color = color
        self.mileage = mileage
        self.price = price
        self.trunkVolume = trunkVolume
        
        self.trunkLoadedVolume = 0.0
        self.engineState = .stop
        self.windowsState = .closed
    }

    mutating func changeEngineState(){
        if engineState == .stop {
            engineState = .start
        } else {
            engineState = .stop
        }
    }
    mutating func changeWindowsState(){
        if windowsState == .closed {
            windowsState = .open
        } else {
            windowsState = .closed
        }
    }
//    mutating func manipulateWithTrunk(){
//        if windowsState == .closed {
//            windowsState = .open
//        } else {
//            windowsState = .closed
//        }
//    }
}

var car = Car(brand: "Audi", model: "A4", year: 2018, color: "black", mileage: .used(odo: 50_000), price: 1_000_000, trunkVolume: 480.0)
var truck = Truck(brand: "Scania", model: "A200", year: 2014, color: "Red", mileage: .used(odo: 500_000), price: 9_000_000, trunkVolume: 50000.0)
