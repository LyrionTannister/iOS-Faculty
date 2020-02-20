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

enum CarState{
    case new
    case secondhand
}

enum Brand: String {
    case bmw = "BMW"
    case mercedes = "Mercedes-Benz"
    case audi = "Audi"
    case vw = "Volkswagen"
    
    var name: String {
        return ("Имя бренда: \(rawValue)")
    }
}

struct Car {
    var brand: Brand
    var model: String
    var color: String
    var mileage: CarState = .new
        
    var price: Int = 500_000
        private(set) var currentDiscount: Int = 0

//    var discont: Int {
//        get {
//            return currentDiscount
//        }
//        set {
//        if currentDiscount != 0 {
//              price += price / (100 - currentDiscount) * 100
//          }
//          guard discount = newValue == 0 ? 1 : newValue
//          currentDiscount = discount
//            price = (price / discount)
//        }
    private(set) var engineState: EngineState = .stop {
        willSet{
            print("Engine state will be changed from \(EngineState) to \(newValue)")
        }
        didSet {
            print("Engine state changed from \(oldValue) to \(EngineState)")
        }
    }
    mutating func changeEngineState(){
        if EngineState == .stop {
            EngineState = .start
        } else {
            EngineState = .stop
        }
    }
    init(brand: Brand, model: Model, color: String, mileage: CarState = .new, price: Int){
        self.brand = brand
//        self.model = model
        self.color = color
        self.mileage = mileage
        self.price = price
    }
    init?(brand: Brand){
        guard brand == .bmw else { return nil}
            self.brand = .bmw
        self.model = "X7"
        self.color = "White"
        self.mileage = .new
        self.price =
        }
        
    }
}




var state = CarState.secondHand(odd: 15_000)
switch state {
case .new:
    print()
}

var brand1 = Brand.mercedes
brand1.name

var car = Car(brand: .bmw, model: "X5", color: "black", mileage: .secondHand(odd: 100_000), price: 1_000_000, )
car
