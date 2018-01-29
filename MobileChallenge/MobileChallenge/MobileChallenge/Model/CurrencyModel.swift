//
//  currencyConverter.swift
//  MobileChallenge
//
//  Created by CtanLI on 2018-01-27.
//  Copyright © 2018 stan. All rights reserved.
//

import Foundation

class CurrencyModel {
    
    //
    // MARK:- properties
    //
    
    var base: String?
    var date: String?
    var rates: NSDictionary?
    
    //
    // MARK:- creation
    //
    
    init(base: String?, date: String?, rates: NSDictionary?) {
        self.base = base
        self.date = date
        self.rates = rates
    }
}
