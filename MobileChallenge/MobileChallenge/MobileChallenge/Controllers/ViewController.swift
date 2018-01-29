//
//  ViewController.swift
//  MobileChallenge
//
//  Created by CtanLI on 2018-01-27.
//  Copyright © 2018 stan. All rights reserved.
//

import UIKit
import Foundation
import DropDown

class ViewController: UIViewController, UITabBarDelegate, UITableViewDataSource {

    //
    // MARK:- properties
    //
    
    // vars
    private var currencyValues: Dictionary<String, AnyObject>?
    private var timer: DispatchSourceTimer?
    private var convertFromCurrency: String?
    private var convertToCurrency: String?
    private var fetchedCurrencyRates = [CurrencyModel]()
    private let selectToCurrencyDropDown = DropDown()
    private let selectFromCurrencyDropDown = DropDown()
    
    private var convertedValues = [ConvertedCurrencyModel]() {
        didSet {
            // rehydrate
            cocnvertedCurrencyListTable.reloadData()
        }
    }
    
    lazy var dropDowns: [DropDown] = {
        return [
            self.selectToCurrencyDropDown,
            self.selectFromCurrencyDropDown
        ]
    }()
    
    // views
    @IBOutlet private weak var cocnvertedCurrencyListTable: UITableView!
    @IBOutlet private weak var selectFromCurrency: UIButton!
    @IBOutlet private weak var selectToCurrency: UIButton!
    @IBOutlet private weak var inputConversionValue: UITextField!
    
    //
    // MARK:- overrides
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrecncyValues()
        selectDropDownAction()
        hideKeyboardWhenViewIsTapped()
        startTimer()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //
    // MARK:- implementations
    //
    
    func startTimer() {
        let queue = DispatchQueue(label: "com.domain.app.timer")
        timer = DispatchSource.makeTimerSource(queue: queue)
        timer?.schedule(deadline: .now(), repeating: .seconds(1800))
        timer?.setEventHandler { [weak self] in
            self?.fetchConversionRate()
        }
        timer!.resume()
    }
    
    // data
    func fetchConversionRate() {
        currencyConverter.sharedInstance.getRequestValues { base, date, rates  in
            GlobalConstants.rateObject = rates
            self.fetchedCurrencyRates.append(CurrencyModel(base: base, date: date, rates: GlobalConstants.rateObject))
        }
    }

    func setCurrecncyValues() {
        selectFromCurrencyDropDown.anchorView = selectFromCurrency
        selectFromCurrencyDropDown.width = 94
        selectFromCurrencyDropDown.bottomOffset = CGPoint(x: 0, y: (selectFromCurrencyDropDown.anchorView?.plainView.bounds.height)! - 1)
        selectFromCurrencyDropDown.dataSource = GlobalConstants.Constants.currencyData
        
        selectToCurrencyDropDown.anchorView = selectToCurrency
        selectToCurrencyDropDown.width = 94
        selectToCurrencyDropDown.bottomOffset = CGPoint(x: 0, y: (selectToCurrencyDropDown.anchorView?.plainView.bounds.height)! - 1)
        selectToCurrencyDropDown.dataSource = GlobalConstants.Constants.currencyData
    }

    func selectDropDownAction() {
        // Action triggered on selection
        selectToCurrencyDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.selectToCurrency.setTitle(item, for: .normal)
            self.convertToCurrency = item
        }
        
        selectFromCurrencyDropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.selectFromCurrency.setTitle(item, for: .normal)
            self.convertFromCurrency = item
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return convertedValues.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ConvertedCurrencyCell.identifier, for: indexPath)
            as! ConvertedCurrencyCell
        cell.currencyInfo = convertedValues[indexPath.row]
        return cell
    }
    
    func presentAlertForError (message: String) {
        let alertController = UIAlertController(title: "Currency Conveter",
                                                message: message,
                                                preferredStyle: UIAlertControllerStyle.alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    func stopTimer() {
        timer?.cancel()
        timer = nil
    }
    
    //
    // MARK:- operations
    //
    
    @IBAction func selectFromCurrencyAction(_ sender: Any) {
        selectFromCurrencyDropDown.show()
    }
    
    @IBAction func setToCurrencyAction(_ sender: Any) {
        selectToCurrencyDropDown.show()
    }
    
    @IBAction func convertValueAction(_ sender: Any) {
        
        guard !(inputConversionValue.text?.isEmpty)! else {
            presentAlertForError(message: GlobalConstants.Constants.emptyInputValue)
            return
        }
        
        guard self.convertToCurrency != nil && self.convertFromCurrency != nil else {
            presentAlertForError(message: GlobalConstants.Constants.selectCurrency)
            return
        }

        let fetchedRates = self.fetchedCurrencyRates[0].rates! as NSDictionary
        let fromCurrency = fetchedRates.object(forKey: self.convertFromCurrency ?? "") as! Float
        let toCurrency = fetchedRates.object(forKey: self.convertToCurrency ?? "") as! Float
        
        guard let inputCurrency = Float(inputConversionValue.text!) else {
            return
        }
        
        if inputCurrency > Float(0) {
            let convertedCurrency = (toCurrency / fromCurrency) * inputCurrency
            currencyValues = ["fromCurrency": self.convertFromCurrency as AnyObject, "toCurrency": self.convertToCurrency as AnyObject, "rate": convertedCurrency as AnyObject]
            let currencyValue = ConvertedCurrencyModel()
            currencyValue.setValuesForKeys(currencyValues!)
            convertedValues.append(currencyValue)
        }
    }
    
    //
    // MARK:- destruction
    //
    
    deinit {
        self.stopTimer()
    }
}

