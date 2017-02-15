//
//  File.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-13.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func asCurrency()->String {
        
        let value = Double(self)
        if (value == nil) {
            return "invalid"
        }
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.groupingSeparator = " "
        formatter.groupingSize = 3
        formatter.minimumFractionDigits = 2;
        formatter.maximumFractionDigits = 2;
        formatter.minimumIntegerDigits = 1
        return formatter.string(from: NSNumber(value: value!))!
    }
}
