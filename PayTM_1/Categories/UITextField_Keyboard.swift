//
//  UITextField_Keyboard.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-13.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import Foundation
import UIKit


extension UITextField {
    
    
    func addKeyboardButtons() {
        
        let numberPadToolbar = UIToolbar(frame: CGRect(x:0,y:0,width:self.bounds.size.width,height:44))
        numberPadToolbar.barTintColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        numberPadToolbar.items = [
            UIBarButtonItem(title: "Hide", style: UIBarButtonItemStyle.done, target: self, action: #selector(resignFirstResponder))
        ]
        
        self.inputAccessoryView = numberPadToolbar
    }
    

    
}
