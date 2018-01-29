//
//  GlobalConstants.swift
//  MobileChallenge
//
//  Created by CtanLI on 2018-01-27.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation

class GlobalConstants: NSObject {
    
    //
    // MARK:- constants
    //
    
    struct Constants {
        static let rateObjectKey = "rateObjectKey"
        static let emptyInputValue = "Please anter a Value"
        static let selectCurrency = "Please select currency"
        static let currencyData = ["AUD", "BGN", "BRL", "CAD", "CHF", "CNY", "CZK", "DKK",
                            "KRW", "MXN", "MYR", "NOK", "NZD", "PHP", "PLN", "RON",
                            "RUB", "SEK","SGD", "THB", "TRY", "USD", "ZAR","GBP",
                            "HKD", "HRK", "HUF", "IDR", "ILS", "INR", "JPY",]
    }
    
    //
    // MARK:- helpers
    //
    
    static var rateObject: NSDictionary {
        get {
            return UserDefaults.standard.value(forKey: Constants.rateObjectKey) as! NSDictionary
        }
        set {
            UserDefaults.standard.set(newValue, forKey: Constants.rateObjectKey)
        }
    }
}
