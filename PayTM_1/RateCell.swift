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
    
    
    weak var dataProvider: DataProvider?
    var atIndex: Int = 0
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder:aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(RateCell.onCellUpdate), name: Notifications.notificationInputUpdated(), object: nil)
    }


    func onCellUpdate(notification:Notification) -> Void {
        self.update()
    }
    
    
    func update() {
        self.lblRate.text =  self.dataProvider?.conversionValue(forRow: atIndex) //  String(atIndex)
        self.lblCurrency.text = self.dataProvider?.currency(forRow:atIndex)
    }
    
}
