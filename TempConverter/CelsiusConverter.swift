//
//  CelsiusConverter.swift
//  TempConverter
//
//  Created by David Svensson on 2022-11-29.
//

import Foundation


class CelsiusConverter {
    
    
    func degreesFahrenheit(degreesCelsius: Int) -> Int {
        
        let tempF = 1.8 * Double(degreesCelsius) + 32.0
        
        return Int(round(tempF))
    }
    
}
