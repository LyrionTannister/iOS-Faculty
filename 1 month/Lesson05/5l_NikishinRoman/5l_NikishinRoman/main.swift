//
//  main.swift
//  5l_NikishinRoman
//
//  Created by Admin on 27.02.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//
/*
 1. Создать протокол «Car» и описать свойства, общие для автомобилей, а также метод действия.
 2. Создать расширения для протокола «Car» и реализовать в них методы конкретных действий с автомобилем: открыть/закрыть окно, запустить/заглушить двигатель и т.д. (по одному методу на действие, реализовывать следует только те действия, реализация которых общая для всех автомобилей).
 3. Создать два класса, имплементирующих протокол «Car» - trunkCar и sportСar. Описать в них свойства, отличающиеся для спортивного автомобиля и цистерны.
 4. Для каждого класса написать расширение, имплементирующее протокол CustomStringConvertible.
 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
 6. Вывести сами объекты в консоль.
 */

import Foundation

enum EngineState {
    case start
    case stop
    case turboOn
    case turboOff
    
}

enum WindowsState {
    case open
    case close
}

enum TrailerState {
    case disconnected
    case connected
}

protocol Car: AnyObject { // AnyObject - чтобы не указывать mutating
    var release: Int { get }
    var trunk: Double { get }
    var doorCount: Int { get }
    var maxSpeed: Int { get }
    var color: String { get }
    var engineState: EngineState { get set }
    var windowsState: WindowsState { get set }
    
    func engineModeChange()
    func windowsModeChange()
}

extension Car { // методы общие для всех авто
    func engineModeChange() {
        if self.engineState == .stop {
            self.engineState = .start
            print("Engine started")
        }
        else {
            self.self.engineState = .stop
            print("Engine stopped")
        }
    }
}
    
extension Car {
    func windowsModeChange() {
        if self.windowsState == .close {
            self.windowsState = .open
            print("Windows opened")
        } else {
            self.windowsState = .close
            print("Windows closed")
        }
    }
}

extension CargoTruck: CustomStringConvertible {
    var description: String {
        return """
        \n *****************
        Description of truck:
        Model year: \(release)
        объём цистерны: \(trunk)
        количество дверей: \(doorCount)
        максимальная скорость: \(maxSpeed)
        цвет: \(color)
        состояние двигателя - \(engineState)
        состояние окон: \(windowsState)\n количество колёс - \(wheelCount)
        наличие прицепа: \(trailer)
        состояние прицепа: \(trailerMode)
        \n *****************
        """}
}

final class CargoTruck: Car {
    
    var release: Int
    var trunk: Double
    var doorCount: Int
    var maxSpeed: Int
    var color: String
    var engineState: EngineState
    var windowsState: WindowsState
    
    let wheelCount: Int
    let trailer: Bool
    var trailerMode: TrailerState
    
    init(release: Int, trunk: Double, doorCount: Int, maxSpeed: Int, color: String, engineMode: EngineState, windowsMode: WindowsState, wheelCount: Int, trailer: Bool, trailerMode: TrailerState) {
        self.release = release
        self.trunk = trunk
        self.doorCount = doorCount
        self.maxSpeed = maxSpeed
        self.color = color
        self.engineState = engineMode
        self.windowsState = windowsMode
        self.wheelCount = wheelCount
        self.trailer = trailer
        self.trailerMode = trailerMode
    }
    
    func trailerModeChange() { // метод прицепить/отцепить прицеп если он есть в наличии
        if self.trailer { // проверка на наличие прицепа
            self.trailerMode = .connected
        }
    }
}

var truck1 = CargoTruck(release: 1985, trunk: 3000, doorCount: 2, maxSpeed: 180, color: "Red", engineMode: .stop, windowsMode: .close,  wheelCount: 18, trailer: true, trailerMode: .disconnected)

truck1.windowsModeChange() // метод из протокола общего для всех авто
truck1.engineModeChange() // метод протокола. Здесь - только смена состояния двигателя stop/start
truck1.engineModeChange()
truck1.trailerModeChange() // местный метод класса TrunkCar
print(truck1.description)

extension SportCar: CustomStringConvertible {
    var description: String {
        return "\n *****************\nописание SportCar\n \nгод выпуска - \(release)\n объём багажника - \(trunk)\n количество дверей - \(doorCount)\n максимальная скорость - \(maxSpeed)\n цвет - \(color)\n состояние двигателя - \(engineState)\n состояние окон - \(windowsState)\n наличие ускорителя - \(turboAccelerator)"
    }
}

final class SportCar: Car {
    var release: Int
    var trunk: Double
    var doorCount: Int
    var maxSpeed: Int
    var color: String
    var engineState: EngineState
    var windowsState: WindowsState
    
    let turboAccelerator: Bool // новое свойство наследника
    
    init(release: Int, trunk: Double, doorCount: Int, maxSpeed: Int, color: String, engineMode: EngineState, windowsMode: WindowsState, turboAccelerator: Bool) {
        self.release = release
        self.trunk = trunk
        self.doorCount = doorCount
        self.maxSpeed = maxSpeed
        self.color = color
        self.engineState = engineMode
        self.windowsState = windowsMode
        self.turboAccelerator = turboAccelerator
    }
    
    func engineModeChange() { // переписааный метод родителя, в который добавлены 2 состояния двигателя turboOn/turboOff
        switch self.engineState {
        case .stop: self.engineState = .start
        case .start: self.engineState = .turboOn
        case .turboOn: self.engineState = .turboOff
        case .turboOff: self.engineState = .stop
        }
    }
}

var sportCar1 = SportCar(release: 2017, trunk: 450, doorCount: 3, maxSpeed: 230, color: "Yellow", engineMode: .stop, windowsMode: .close, turboAccelerator: true)


sportCar1.engineModeChange()

sportCar1.engineModeChange()
sportCar1.engineModeChange()
sportCar1.windowsModeChange()
print(sportCar1.description)

