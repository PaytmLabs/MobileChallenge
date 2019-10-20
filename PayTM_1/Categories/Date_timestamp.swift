//
//  Date_timestamp.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-13.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    
    static func from(description: String)->Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        return formatter.date(from: description)!
    }
}
