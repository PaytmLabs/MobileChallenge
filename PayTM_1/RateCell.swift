//
//  RateCell.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-10.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import UIKit

class RateCell: UICollectionViewCell {
    
    @IBOutlet weak var lblRate: UILabel!
    
    @IBOutlet weak var lblCurrency: UILabel!
    
//    override init(frame: CGRect) {
//        super.init(frame:frame)
////        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onCellUpdate), name: self.dataProvider.notificationName, object: nil)
//    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(RateCell.onCellUpdate), name: Notifications.notificationInputUpdated(), object: nil)
    }

    func onCellUpdate(notification:Notification) -> Void {
        
        self.lblCurrency.textColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
    }
    
}
