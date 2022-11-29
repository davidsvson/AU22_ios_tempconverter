//
//  ViewController.swift
//  TempConverter
//
//  Created by David Svensson on 2022-11-29.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    

    @IBOutlet weak var temperatureLabel: UILabel!
    
    @IBOutlet weak var celsiusPickerView: UIPickerView!
    
    private let userDefaultsRowKey = "deafultsRowKey"
    
    private var temperatureValues = (-100...100).reversed().map{$0}
    
    let converter = CelsiusConverter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
//
//        for index in -100...100 {
//            temperatureValues.append(index)
//        }
        
        let defaultPickerRow = initialPickerRow()
        
        celsiusPickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
        pickerView(celsiusPickerView, didSelectRow: defaultPickerRow, inComponent: 0)
        
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return temperatureValues.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return "\(temperatureValues[row]) ºC"
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       // print("\(row) :  \(temperatureValues[row])")
        
        let tempC = temperatureValues[row]
        let tempF = converter.degreesFahrenheit(degreesCelsius: tempC)
        
        temperatureLabel.text = "\(tempF) ºF"
        saveSelected(row: row)
    }
    
    func initialPickerRow() -> Int {
        
        let savedRow = UserDefaults.standard.object(forKey: userDefaultsRowKey) as? Int
        
        if let row = savedRow {
            return row
        } else {
            return temperatureValues.count / 2
        }
        
    }
    
    func saveSelected(row : Int) {
        
        let defaults = UserDefaults.standard
        
        defaults.set(row, forKey: userDefaultsRowKey )
        defaults.synchronize()
        
        
    }
}

