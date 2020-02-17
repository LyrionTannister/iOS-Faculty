//
//  QuadraticEquation.swift
//  1l_NikishinRoman
//
//  Created by Roman on 16.02.2020.
//  Copyright © 2020 RomanNikishin. All rights reserved.
//

// Решить квадратное уравнение.
import Foundation

public func Quadratic_Equation(a: Double,b: Double,c: Double) -> (){
    var roots: [Double] = [0,0]
    
    guard a != 0 else {
        return print("Ошибка! a не может быть равно 0")
    }
    
    func solve(a: Double, b: Double, c: Double) -> ([Double]){
        let sd: Double = sqrt(pow(b, 2) - 4.0 * a * c)
        let aa: Double = 2.0 * a

        return ([(-b + sd) / aa,(-b - sd) / aa])
    }
    
    roots = solve(a: a, b: b, c: c)
    
    print("Первый коренть уравнения: \(roots[0]) \n Второй корень уравнения: \(roots[1])")
}
