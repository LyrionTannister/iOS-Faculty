//
//  BankDeposit.swift
//  1l_NikishinRoman
//
//  Created by Roman on 16.02.2020.
//  Copyright © 2020 RomanNikishin. All rights reserved.
//

// Пользователь вводит сумму вклада в банк и годовой процент. Найти сумму вклада через 5 лет.

import Foundation

public func PerformBankDeposit() -> (){
    var userAmount: Double = 0
    var userPercent: Double = 0
    
    print("Введите сумму вашего вклада")
    while (true){
        if let input = readLine(),
            let value = Double(input) {
            userAmount = value
            break
        } else {
            print("Введите, пожалуйста, число")
        }
    }

    print("Введите процент вашего вклада")
    while (true) {
        if let input = readLine(),
            let value = Double(input) {
            userPercent = value
            break
        } else {
            print("Введите, пожалуйста, число")
        }
    }
    
    BankDeposit(amount: userAmount, percent: userPercent)
}

func BankDeposit(amount: Double, percent: Double) -> () {
    let percentOf = percent/100
    var amountOf = amount
    
    for i in 1...5 {
        amountOf = amountOf + (amountOf * percentOf)
        print("\(i) год, на счёте: \(amountOf)")
    }
}
