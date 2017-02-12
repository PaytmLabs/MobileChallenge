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
        self.addPadToolbarButtons()
        // Do any additional setup after loading the view, typically from a nib.
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onDatalUpdate), name: Notifications.notificationDataUpdated(), object: nil)
    }

    
    func updateUI() {
        self.lblTimestamp.text = dataProvider.getLastServerResponse()?.timestamp ?? "no data yet..."
        self.btnCurrency.setTitle(self.dataProvider.currency(forRow:0)+" 🔽",for: .normal)
    }
    
    func onDatalUpdate () {
        // update UI
        self.updateUI()
        self.collectionView.reloadData()
    }
    
    func addPadToolbarButtons() {
        
        let numberPadToolbar = UIToolbar(frame: CGRect(x:0,y:0,width:self.view.bounds.size.width,height:44))
        numberPadToolbar.barTintColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
        
        numberPadToolbar.items = [
            UIBarButtonItem(title: "Hide", style: UIBarButtonItemStyle.done, target: self.fldInput, action: #selector(resignFirstResponder))
        ]
        
        self.fldInput.inputAccessoryView = numberPadToolbar
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DataProvider.shared.updateData()
    }
    
    
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


}

