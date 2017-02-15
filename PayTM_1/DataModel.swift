//
//  DataModel.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-10.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation

var baseCurrency = ["EUR":1.0]

class DataModel {

    var rates: [String: Double] = baseCurrency
    var currencies: [String] = Array(baseCurrency.keys)

    var baseCurencyInputValue: Double = 0
    var baseCurrencyIndex: Int = 0

    
    func update(data: Data) {
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]

            self.rates = json!["rates"] as! [String : Double]
            self.rates[Array(baseCurrency.keys)[0]] = 1.0
            self.currencies = Array(self.rates.keys).sorted()
 
        } catch {
            print("error in JSONSerialization")
        }
    }
    
    func conversionValue(forRow:Int)->Double {
        
        let currency = currencies[baseCurrencyIndex]
        let toEuro = Double(self.rates[currency]!)
        let rate = Double(self.rates[currencies[forRow]]!)
        return baseCurencyInputValue / toEuro * rate
    }
    
}
