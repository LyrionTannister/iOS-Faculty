//
//  main.swift
//  4l_NikishinRoman
//
//  Created by Roman on 24.02.2020.
//  Copyright © 2020 Roman Nikishin. All rights reserved.
//

/*


 4. В каждом подклассе переопределить метод действия с автомобилем в соответствии с его классом.

 5. Создать несколько объектов каждого класса. Применить к ним различные действия.

 6. Вывести значения свойств экземпляров в консоль.
 */

import Foundation

/// 1. Описать класс Car c общими свойствами автомобилей и пустым методом действия по аналогии с прошлым заданием.
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
         price: Int,
         trunkVolume: Int
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

/// 2. Описать пару его наследников CargoTruck и sportСar. Подумать, какими отличительными свойствами обладают эти автомобили. Описать в каждом наследнике специфичные для него свойства.

class CargoTruck: Car {
    private(set) var trunkVolume: Double
    private(set) var trunkLoadedVolume: Double
    
    enum Actions {
        case changeEngineState
        case changeWindowsState
        case loadTrun(tons: Double)
        case enableLaunch
        case setRevsForLaunch(revs: Int)
    }
    
    init(trunkVolume: Double, trunkLoadedVolume: Double) {
        self.trunkVolume = trunkVolume
        self.trunkLoadedVolume = trunkLoadedVolume
    }
    
    /// 3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет CargoTruck. Добавить эти действия в перечисление.
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
    }
}

class SportCar: Car {
    private(set) var launchControl: Bool
    private(set) var revsOflaunchControl: Int
    private(set) var boostControl: Bool
    
    enum Actions {
        case changeEngineState
        case changeWindowsState
        case enableBoost
        case enableLaunch
        case setRevsForLaunch(revs: Int)
    }
    
    init(launchControl: Bool, boostControl: Bool, revsOflaunchControl: Int = 3000) {
        self.launchControl = launchControl
        self.boostControl = boostControl
        self.revsOflaunchControl = revsOflaunchControl
    }
    ///3. Взять из прошлого урока enum с действиями над автомобилем. Подумать, какие особенные действия имеет sportCar. Добавить эти действия в перечисление.
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
            <#code#>
        case .nableBoost:
            <#code#>
        case .enableLaunch:
            <#code#>
        case .setRevsForLaunch(let revs):
            <#code#>
default:
            <#code#>
        }
    }
    override func description() {
    }
}

    
    func descriprion(){
        print("""
            \n
            Brand: \(brand)
            Model: \(model)
            Model year: \(year)
            Color: \(color)
            Current car conditions: \(mileage)
            Car price \(price)
            Current engine status: \(engineState)
            Current windows status: \(windowsState)
            Maximun trunk volume: \(trunkVolume)
            Current trunk load: \(trunkLoadedVolume)\n
            """)
        
    }

    fileprivate func actions() {
        
}
