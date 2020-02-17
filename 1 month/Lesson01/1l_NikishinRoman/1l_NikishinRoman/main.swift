//
//  main.swift
//  1l_NikishinRoman
//
//  Created by Roman on 16.02.2020.
//  Copyright © 2020 RomanNikishin. All rights reserved.
//

import Foundation
// Тестируем функцию квадратного уравнения
print("Тестируем функцию квадратного уравнения")

Quadratic_Equation(a: 1.0, b: 22.0, c: -1323.0) // два разных реальных корня
Quadratic_Equation(a: 6.0, b: -23.0, c: 20.0) // когда a != 1.0
Quadratic_Equation(a: 1.0, b: -1.0e7, c: 1.0) // когда один корень почти ноль
Quadratic_Equation(a: 1.0, b: 2.0, c: 1.0) // один настоящий корень
Quadratic_Equation(a: 0.0, b: 2.0, c: -13.0) // Когда а равно 0

// Тестируем работу функции по рассчёту треугольника

TriangleCalculations(a: 3, b: 4)

// Тестируем работу функции по рассчёту вклада

PerformBankDeposit()
