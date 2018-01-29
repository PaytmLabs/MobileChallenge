//
//  ConvertedCurrencyCell.swift
//  MobileChallenge
//
//  Created by CtanLI on 2018-01-27.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit

class ConvertedCurrencyCell: UITableViewCell, Reusable {

    //
    // MARK:- properties
    //
    
    // views
    @IBOutlet weak var convertedResults: UILabel!
    @IBOutlet weak var toCurrency: UILabel!
    @IBOutlet weak var fromCurrency: UILabel!
    
    // data
    var currencyInfo = ConvertedCurrencyModel() {
        didSet {
            // hydrate
            if let rateValue = currencyInfo.rate {
                convertedResults.text = String(describing: rateValue)
            }
            fromCurrency.text = currencyInfo.fromCurrency
            toCurrency.text = currencyInfo.toCurrency
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
