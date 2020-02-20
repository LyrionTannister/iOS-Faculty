//
//  main.swift
//  2l_NikishinRoman
//
//  Created by Admin on 17.02.2020.
//  Copyright © 2020 Nikishin Roman. All rights reserved.
//

/*
5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов.
Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.

6. * Заполнить массив из 100 элементов различными простыми числами. Натуральное число, большее единицы, называется простым, если оно делится только на себя и на единицу. Для нахождения всех простых чисел не больше заданного числа n, следуя методу Эратосфена, нужно выполнить следующие шаги:
a. Выписать подряд все целые числа от двух до n (2, 3, 4, ..., n).
b. Пусть переменная p изначально равна двум — первому простому числу.
c. Зачеркнуть в списке числа от 2p до n, считая шагами по p (это будут числа, кратные p: 2p, 3p, 4p, ...).
d. Найти первое не зачёркнутое число в списке, большее, чем p, и присвоить значению переменной p это число.
e. Повторять шаги c и d, пока возможно.
*/

import Foundation

// 1. Написать функцию, которая определяет, четное число или нет.
func evenOrNot(a: Int) -> Bool {
    return (a % 2) == 0
}

// 2. Написать функцию, которая определяет, делится ли число без остатка на 3.
func divideBy3(a: Int) -> Bool {
    return (a % 3) == 0
}

// 3. Создать возрастающий массив из 100 чисел.
func createIncArrayOf100Elements() -> (Array<Int>) {
    var targetArray: Array<Int> = []
    for i in stride(from: -100, to: 200, by: 3) {
        targetArray.append(i)
    }
    return targetArray
}
// 4. Удалить из этого массива все четные числа и все числа, которые не делятся на 3.
func cleanupArray(sourceArray: Array<Int>) -> (Array<Int>){
    var sourceArray = sourceArray
    for (_,num) in sourceArray.enumerated() {
        if evenOrNot(a: num) || divideBy3(a: num) {
            sourceArray.remove(at: sourceArray.firstIndex(of: num)!)
        }
    }
    return sourceArray
}

// 5. * Написать функцию, которая добавляет в массив новое число Фибоначчи, и добавить при помощи нее 100 элементов. Числа Фибоначчи определяются соотношениями Fn=Fn-1 + Fn-2.
func createFibonacciArray() -> (Array<Double>){
    var fibi: Array<Double> = []
    
    var fibPrev: Double = 1
    var fib: Double = 1
    
    while fibi.count < 100 {
        fibi.append(fib)
        (fibPrev, fib) = (fib, fib + fibPrev)
    }
    return fibi

}

// Testing functions
print(evenOrNot(a: 123123))
print(divideBy3(a: 123123))
print(createIncArrayOf100Elements())
print(cleanupArray(sourceArray: createIncArrayOf100Elements()))
print(createFibonacciArray())
