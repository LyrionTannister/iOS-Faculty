//
//  main.swift
//  4l_NikishinRoman
//
//  Created by Roman on 24.02.2020.
//  Copyright © 2020 Roman Nikishin. All rights reserved.
//

import Foundation

// 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
enum CarState {
    case new
    case used(odo: Int)
}
enum EngineState {
    case stopped
    case started
}
enum EngineType {
    case gasoline
    case diesel
    case hybrid
    case electric
}
enum WindowsState {
    case opened
    case closed
}

class Car {
    let brand: String
    let model: String
    let year: Int
    var color: String
    var mileage: CarState
    let engineType: EngineType
    var price: Int
    

    var engineState: EngineState
    var windowsState: WindowsState
    

    init(brand: String,
         model: String,
         year: Int,
         color: String,
         mileage: CarState = .new,
         engineType: EngineType,
         price: Int
    ){
        self.brand = brand
        self.model = model
        self.year = year
        self.color = color
        self.mileage = mileage
        self.engineType = engineType
        self.price = price
        self.engineState = .stopped
        self.windowsState = .closed
    }
    
    func action (){
    }
    func description() {
    }
}

// 2. Описать пару его наследников CargoTruck и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

class CargoTruck: Car {
    private(set) var trunkVolume: Double
    private(set) var trunkLoadedVolume: Double = 0.0
    
//    3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет CargoTruck. Добавить эти действия в перечисление.
    enum Actions {
        case changeEngineState
        case changeWindowsState
        case loadTrunk(tons: Double)
        case unloadTrunk(tons: Double)
    }
    
    init(brand: String, model: String, year: Int, color: String, mileage: CarState = .new, engineType: EngineType, price: Int, trunkVolume: Double) {
        self.trunkVolume = trunkVolume
        super.init(brand: brand, model: model, year: year, color: color, mileage: mileage, engineType: engineType, price: price)
    }
    
//    4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    func action (_ action: Actions){
        switch action {
        case .changeEngineState:
            if engineState == .stopped {
                engineState = .started
                print("Engine started")
            } else {
                engineState = .stopped
                print("Enngine stopped")
            }
        case .changeWindowsState:
            if windowsState == .closed {
                windowsState = .opened
                print("Windows opened")
            } else {
                windowsState = .closed
                print("Windows closed")
            }
        case .loadTrunk(let loadingWeight):
            if trunkVolume < loadingWeight {
                print("Your luggage is larger than trunk!")
            } else {
                trunkLoadedVolume += loadingWeight
                print("Free space left: \(trunkVolume - trunkLoadedVolume) liters")
            }
        case .unloadTrunk(let unloadedWeight):
            if trunkLoadedVolume - unloadedWeight >= 0 {
                trunkLoadedVolume -= unloadedWeight
                print("Free space left: \(trunkVolume - trunkLoadedVolume) liters")
            } else {
                print("You cannot unload such amount, it's larger than \(trunkVolume - trunkLoadedVolume) liters left")
            }
        }
    }
    
    override func description() {
        print("""
            \n
            Brand: \(brand)
            Model: \(model)
            Model year: \(year)
            Color: \(color)
            Truck Engine Type: \(engineType)
            Current car conditions: \(mileage)
            Car price \(price)
            Current engine status: \(engineState)
            Current windows status: \(windowsState)
            Maximun trunk volume: \(trunkVolume)
            Current trunk load: \(trunkLoadedVolume)\n
            """)
    }
}

class SportCar: Car {
    private(set) var launchControl: Bool = false
    private(set) var revsOflaunchControl: Int
    private(set) var boostControl: Bool
    
//    3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет CargoTruck. Добавить эти действия в перечисление.
    enum Actions {
        case changeEngineState
        case changeWindowsState
        case switchBoost
        case switchLaunch
        case setRevsForLaunch(revs: Int)
    }
    
    init(brand: String, model: String, year: Int, color: String, mileage: CarState, engineType: EngineType, price: Int, boostControl: Bool, revsOflaunchControl: Int) {
//        self.launchControl = launchControl
        self.boostControl = boostControl
        self.revsOflaunchControl = revsOflaunchControl
        super.init(brand: brand, model: model, year: year, color: color, mileage: mileage, engineType: engineType, price: price)
    }
    
//    4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.
    func action (_ actions: Actions){
        switch actions {
        case .changeEngineState:
            if engineState == .stopped {
                self.engineState = .started
                print("Engine started")
            } else {
                engineState = .stopped
                print("Enngine stopped")
            }
        case .changeWindowsState:
            if windowsState == .closed {
                windowsState = .opened
                print("Windows opened")
            } else {
                windowsState = .closed
                print("Windows closed")
            }
        case .switchBoost:
            if boostControl == false {
                boostControl = true
                print("Boost on")
            } else {
                boostControl = false
                print("Boost off")
            }
        case .switchLaunch:
            if launchControl == false {
                launchControl = true
                print("launchControl armed at \(revsOflaunchControl)rpms")
            } else {
                launchControl = false
                print("launchControl disarmed")
            }
        case .setRevsForLaunch(let revs):
            guard revs >= 0 && revs <= 7_000 else {
                print("RPM must be from 0 to 7000!")
                return
            }
            revsOflaunchControl = revs
        }
    }
    override func description() {
        print("""
            \n
            Sportcar Brand: \(brand)
            Model: \(model)
            Model year: \(year)
            Color: \(color)
            Current car conditions: \(mileage)
            Car price \(price)
            Car Engine Type: \(engineType)
            Current engine state: \(engineState)
            Current windows state: \(windowsState)
            Launch control state: \(launchControl)
            Boost control state: \(boostControl)
            RPM for launch control sequence: \(revsOflaunchControl)
            """)
    }
}

// 5. Создать несколько объектов каждого класса. Применить к ним различные действия.
var porsche = SportCar(brand: "Porsche", model: "Cayman", year: 2019, color: "Cyan", mileage: .new, engineType: .diesel, price: 5_800_000, boostControl: true, revsOflaunchControl: 3_500)
var gtr = SportCar(brand: "Nissan", model: "GT-R", year: 2018, color: "White", mileage: .used(odo: 34_000), engineType: .gasoline, price: 3_500_000, boostControl: true, revsOflaunchControl: 4_000)
// 6. Вывести значения свойств экземпляров в консоль.
porsche.description()
gtr.description()

porsche.action(.changeEngineState)
porsche.action(.changeWindowsState)
porsche.action(.switchBoost)
porsche.action(.switchLaunch)
porsche.action(.setRevsForLaunch(revs: 4_000))

porsche.description()

var scania = CargoTruck(brand: "Scania", model: "F35", year: 2015, color: "Red", engineType: .diesel, price: 8_120_420, trunkVolume: 5000)

scania.description()

scania.action(.loadTrunk(tons: 5100))
scania.action(.loadTrunk(tons: 3645))
scania.action(.unloadTrunk(tons: 4000))

scania.description()

 
