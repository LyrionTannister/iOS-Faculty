//
//  main.swift
//  7l_NikishinRoman
//
//  Created by Admin on 05.03.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

import Foundation

enum VendingError: Error {
    case invalidSelection
    case outOfStock
    case noMoneyNoHoney(coinsNeeded: Int)
}

enum BuyError: Error {
    case customerNotFound
}

struct Product {
    var name: String
}

struct Item {
    let price: Int
    var count: Int
    let product: Product
}

class VendingMachine {
    private(set) var inventory = [
        "Pringles" : Item(price: 40, count: 13, product: Product(name: "Pringles")),
        "Yoghurt" : Item(price: 65, count: 2, product: Product(name: "Danone")),
        "Coca-Cola" : Item(price: 79, count: 0, product: Product(name: "Cola")),
        "M&M's": Item(price: 35, count: 234, product: Product(name: "M&M's"))
    ]
    
    var deposite: Int = 0
    
    func vend(item name: String) throws -> Product? {
        guard var item = inventory[name] else { throw VendingError.invalidSelection }
        guard item.count > 0 else { throw VendingError.outOfStock }
        guard item.price < deposite else { throw VendingError.noMoneyNoHoney(coinsNeeded: item.price - deposite) }
        
        deposite -= item.price
        item.count -= 1
        print("Получите товар: \(item.product.name)")
        return item.product
    }
}

let favorite = [
    "Anna" : "Pringles",
    "Alex" : "Yoghurt",
    "Adam" : "Coca-Cola"
]

func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws -> Product {
    guard let name = favorite[person] else {throw BuyError.customerNotFound}
    return try vendingMachine.vend(item: name)!
}

func testSnackMachine() {
    let machine = VendingMachine()
    
    machine.deposite = 50
    //print("\(String(describing: try? machine.vend(item: "Pringles")))")
    //print("\(String(describing: try? machine.vend(item: "Yoghurt")))")
    //print("\(String(describing: try? machine.vend(item: "Yoghurt")))")
    //print("\(String(describing: try? machine.vend(item: "Yoghurt")))")
    //
    //let vend1 = try? machine.vend(item: "Yoghurt")
    
    do {
        try machine.vend(item: "Pocky")
    } catch VendingError.invalidSelection {
        print("Данного товара нет в списке предложенных")
    } catch VendingError.outOfStock {
        print("Товар закончился")
    } catch VendingError.noMoneyNoHoney(let coinsNeeded) {
        print("Необходимо внести \(coinsNeeded) монет")
    } catch {
        print(error.localizedDescription)
    }
    
    do {
        try buyFavoriteSnack(person: "Petr", vendingMachine: machine)
    } catch BuyError.customerNotFound {
        print("Не найден такой покупатель")
    } catch VendingError.invalidSelection {
        print("Данного товара нет в списке предложенных")
    } catch VendingError.outOfStock {
        print("Товар закончился")
    } catch VendingError.noMoneyNoHoney(let coinsNeeded) {
        print("Необходимо внести \(coinsNeeded) монет")
    } catch {
        print(error.localizedDescription)
    }
}
