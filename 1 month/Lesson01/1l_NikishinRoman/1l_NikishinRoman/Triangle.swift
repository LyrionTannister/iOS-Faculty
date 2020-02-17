//
//  Triangle.swift
//  1l_NikishinRoman
//
//  Created by Roman on 16.02.2020.
//  Copyright © 2020 RomanNikishin. All rights reserved.
//

// Даны катеты прямоугольного треугольника. Найти площадь, периметр и гипотенузу треугольника.

import Foundation

public func TriangleCalculations(a: Double, b: Double) -> (){
    let c = sqrt(pow(a, 2) + pow(b, 2))
    print("\n Длина гипотенузы треугольника с катетами \(a) и \(b): \(c)")
    print("Периметр треугольника с катетами \(a) и \(b): \(a + b + c)")
    print("Площадь треугольника с катетами \(a) и \(b): \((a * b)/2)")
}
