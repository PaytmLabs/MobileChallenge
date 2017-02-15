//
//  ViewController.swift
//  PayTM_1
//
//  Created by Konstantin Klyatskin on 2017-02-09.
//  Copyright © 2017 Konstantin Klyatskin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
   
    @IBOutlet weak var lblTimestamp: UILabel!
    @IBOutlet weak var btnCurrency: UIButton!
    @IBOutlet weak var fldInput: UITextField!
    
    lazy var dataProvider =  DataProvider.shared
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        self.fldInput.addKeyboardButtons()
        self.fldInput.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
  
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onDataUpdate), name: Notifications.notificationDataUpdated(), object: nil)
    }

    
    func updateUI() {
        self.lblTimestamp.text = dataProvider.getLastServerResponse()?.timestamp ?? "no data loaded yet..."
        self.btnCurrency.setTitle(self.dataProvider.currency(forRow:self.dataProvider.baseCurrencyIndex())+" 🔽",for: .normal)
    }
    
    func onDataUpdate () {
        // update UI
        self.updateUI()
        self.collectionView.reloadData()
    }
    
    
    // MARK: - Collection DS
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        
        return self.dataProvider.numberOfCurrencies()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RateCellID", for: indexPath) as! RateCell
        cell.dataProvider = self.dataProvider
        cell.atIndex = indexPath.row
        cell.update()
        
        return cell
    }

    //MARK: - IBActions
    
    
    @IBAction func btnTapped(_ sender: UIButton) {
    
        let alert = UIAlertController(title: "Currency list", message: "Select base currency", preferredStyle: .actionSheet)

        for i in 0 ..< self.dataProvider.numberOfCurrencies() {
            let  action = UIAlertAction(title: self.dataProvider.currency(forRow: i), style: .default, handler: { (action) -> Void in

                self.dataProvider.setBaseCurrency(atIndex:i)
                self.updateUI()
                self.collectionView.reloadData()
            
            })
            alert.addAction(action)
        }
        
        self.present(alert, animated: true, completion: nil)

    }
    
    func textFieldChanged(textField:UITextField) {

        let value = Double(textField.text!)
        self.dataProvider.setBaseCurencyInputValue(atValue: value)        
        NotificationCenter.default.post(name: Notifications.notificationInputUpdated(), object: nil)
    }
}

