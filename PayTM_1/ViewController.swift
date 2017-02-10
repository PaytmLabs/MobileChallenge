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
        // Do any additional setup after loading the view, typically from a nib.
        self.lblTimestamp.text = dataProvider.getLastServerResponse()?.timestamp ?? "no data yet..."

        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.onDatalUpdate), name: self.dataProvider.notificationName, object: nil)


    }

    func onDatalUpdate () {
        // update UI
        self.collectionView.reloadData()
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
        
        return self.dataProvider.numberOfItems()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "RateCellID", for: indexPath) as! RateCell
        
        cell.lblRate.text = String(indexPath.row)
        cell.lblCurrency.text = self.dataProvider.currencyForRow(indexPath.row)
        
        return cell
    }


}

