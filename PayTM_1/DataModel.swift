//
//  DataModel.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-10.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation

let baseCurrency = ["EUR":1.0]

extension Dictionary {
    
    static func + <K,V>(left: Dictionary<K,V>, right: Dictionary<K,V>)
        -> Dictionary<K,V>
    {
        var map = Dictionary<K,V>()
        for (k, v) in left {
            map[k] = v
        }
        for (k, v) in right {
            map[k] = v
        }
        return map
    }

}

class DataModel {

    var rates: [String: Double] = baseCurrency
    var currencies: [String] = Array(baseCurrency.keys)

    var inputValue: Double = 0
    var inputCurrency: Int = 0

    
    func update(data: Data) {
        
        do {
            let json = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any]

// TODO            self.rates = baseCurrency + ( json!["rates"] as! [String : Double] )
            self.rates = json!["rates"] as! [String : Double]
            self.currencies = Array(self.rates.keys)
 
        } catch {
            print("error in JSONSerialization")
        }
    }
}
