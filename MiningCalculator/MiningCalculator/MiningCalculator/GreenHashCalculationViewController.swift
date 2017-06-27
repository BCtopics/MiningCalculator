//
//  GreenHashCalculationViewController.swift
//  MiningCalculator
//
//  Created by Bradley GIlmore on 6/27/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class GreenHashCalculationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.MoneyViewSetup()
        self.HashViewSetup()
    }
    
    // UIViews
    let moneyView = UIView()
    let hashView = UIView()
    
    
    //MARK: - Hash View
    
    // Search Bar
    let hashrateSearchField = UITextField()
    let mhButton = UIButton()
    
    // Icon Button
    let btcIcon = UIButton()
    
    func HashViewSetup() {
        
        
        // hashrateSearchField / MHButton Setup
        
        self.hashrateSearchField.placeholder = "Enter Hashrate in \(self.hashType)..."
        self.hashrateSearchField.textAlignment = .center
        self.hashrateSearchField.setContentHuggingPriority(249, for: UILayoutConstraintAxis.horizontal)
        
        self.mhButton.setTitle("MH's", for: .normal)
        self.mhButton.setTitleColor(ColorController.textOrange, for: .normal)
        
        self.hashView.addSubview(hashrateSearchField)
        self.hashView.addSubview(mhButton)
        
        HashViewConstraints()
    }
    
    func HashViewConstraints() {
        
        // hashrateSearchField Constraints
        hashrateSearchField.translatesAutoresizingMaskIntoConstraints = false
        
        let searchFieldTop = NSLayoutConstraint(item: hashrateSearchField, attribute: .top, relatedBy: .equal, toItem: hashView, attribute: .top, multiplier: 1.0, constant: 18)
        let searchFieldLeading = NSLayoutConstraint(item: hashrateSearchField, attribute: .leading, relatedBy: .equal, toItem: hashView, attribute: .leading, multiplier: 1.0, constant: 16)
        
        self.hashView.addConstraints([searchFieldTop, searchFieldLeading])
        
        // MHButton Constraints
        mhButton.translatesAutoresizingMaskIntoConstraints = false
        
        let mhButtonLeading = NSLayoutConstraint(item: mhButton, attribute: .leading, relatedBy: .equal, toItem: hashrateSearchField, attribute: .trailing, multiplier: 1.0, constant: 0)
        let mhButtonTrailing = NSLayoutConstraint(item: mhButton, attribute: .trailing, relatedBy: .equal, toItem: hashView, attribute: .trailing, multiplier: 1.0, constant: -16)
        let mhButtonTop = NSLayoutConstraint(item: mhButton, attribute: .top, relatedBy: .equal, toItem: hashView, attribute: .top, multiplier: 1.0, constant: 18)
        let mhButtonHeight = NSLayoutConstraint(item: mhButton, attribute: .height, relatedBy: .equal, toItem: hashrateSearchField, attribute: .height, multiplier: 1.0, constant: 0)
        
        self.hashView.addConstraints([mhButtonLeading, mhButtonTrailing, mhButtonTop, mhButtonHeight])
        
    }
    
    //MARK: - Money View
    
    // Money Amounts
    let usdLabel = UILabel()
    let cryptoAmountLabel = UILabel()
    
    // Hour, Day, Week, Month, Year stackview
    
    let timeStackView = UIStackView()
    
    let hourButton = UIButton()
    let dayButton = UIButton()
    let weekButton = UIButton()
    let monthButton = UIButton()
    
    func MoneyViewSetup() {
        
        // usdLabel Setup
        self.usdLabel.text = "$4,200"
        self.usdLabel.font = UIFont.systemFont(ofSize: 45.0, weight: UIFontWeightMedium)
        self.usdLabel.textColor = .white
        self.usdLabel.textAlignment = .center
        self.moneyView.addSubview(usdLabel)
        
        // cryptoAmountlabel Setup
        
        self.cryptoAmountLabel.text = "BTC: 6.24699"
        self.cryptoAmountLabel.font = UIFont.systemFont(ofSize: 30.0, weight: UIFontWeightRegular)
        self.cryptoAmountLabel.textColor = .white
        self.cryptoAmountLabel.textAlignment = .center
        self.moneyView.addSubview(cryptoAmountLabel)
        
        // Hour, Day, Week, Month Stackview Setup
        
        // StackView
        self.moneyView.addSubview(timeStackView)
        self.timeStackView.distribution = .fillEqually
        self.timeStackView.alignment = .center
        
        // Hour
        self.hourButton.setTitle("Hour", for: .normal)
        self.hourButton.setTitleColor(ColorController.textOrange, for: .normal)
        self.timeStackView.addArrangedSubview(hourButton)
        
        // Day
        self.dayButton.setTitle("Day", for: .normal)
        self.dayButton.setTitleColor(ColorController.textOrange, for: .normal)
        self.timeStackView.addArrangedSubview(dayButton)
        
        // Week
        self.weekButton.setTitle("Week", for: .normal)
        self.weekButton.setTitleColor(ColorController.textOrange, for: .normal)
        self.timeStackView.addArrangedSubview(weekButton)
        
        // Month
        self.monthButton.setTitle("Month", for: .normal)
        self.monthButton.setTitleColor(ColorController.textOrange, for: .normal)
        self.timeStackView.addArrangedSubview(monthButton)
        
        MoneyViewConstraints()
    }
    
    func MoneyViewConstraints() {
        
        // usdLabel Constraints
        usdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let usdLabelTop = NSLayoutConstraint(item: usdLabel, attribute: .top, relatedBy: .equal, toItem: moneyView, attribute: .top, multiplier: 1.0, constant: 20)
        let usdLabelTrailing = NSLayoutConstraint(item: usdLabel, attribute: .trailing, relatedBy: .equal, toItem: moneyView, attribute: .trailing, multiplier: 1.0, constant: -30)
        let usdLabelLeading = NSLayoutConstraint(item: usdLabel, attribute: .leading, relatedBy: .equal, toItem: moneyView, attribute: .leading, multiplier: 1.0, constant: 30)
        let usdLabelBottom = NSLayoutConstraint(item: usdLabel, attribute: .bottom, relatedBy: .equal, toItem: cryptoAmountLabel, attribute: .top, multiplier: 1.0, constant: -10)
        
        self.moneyView.addConstraints([usdLabelTop, usdLabelTrailing, usdLabelLeading, usdLabelBottom])
        
        // CrptoAmountLabel Constraints
        cryptoAmountLabel.translatesAutoresizingMaskIntoConstraints = false

        let cryptoAmountLabelTrailing = NSLayoutConstraint(item: cryptoAmountLabel, attribute: .trailing, relatedBy: .equal, toItem: moneyView, attribute: .trailing, multiplier: 1.0, constant: -30)
        let cryptoAmountLabelLeading = NSLayoutConstraint(item: cryptoAmountLabel, attribute: .leading, relatedBy: .equal, toItem: moneyView, attribute: .leading, multiplier: 1.0, constant: 30)
        
        self.moneyView.addConstraints([cryptoAmountLabelLeading, cryptoAmountLabelTrailing])
        
        // StackView
        timeStackView.translatesAutoresizingMaskIntoConstraints = false
    
        let timeStackViewTop = NSLayoutConstraint(item: timeStackView, attribute: .top, relatedBy: .equal, toItem: cryptoAmountLabel, attribute: .bottom, multiplier: 1.0, constant: 10)
        let timeStackViewTrailing = NSLayoutConstraint(item: timeStackView, attribute: .trailing, relatedBy: .equal, toItem: moneyView, attribute: .trailing, multiplier: 1.0, constant: -30)
        let timeStackViewLeading = NSLayoutConstraint(item: timeStackView, attribute: .leading, relatedBy: .equal, toItem: moneyView, attribute: .leading, multiplier: 1.0, constant: 30)
        
        self.moneyView.addConstraints([timeStackViewTop, timeStackViewLeading, timeStackViewTrailing])

    }
    
    func setup() {
        self.setColors()
        setupConstraints()
    }
    
    func setupConstraints() {
        
        // Money View
        self.view.addSubview(moneyView)
        moneyView.translatesAutoresizingMaskIntoConstraints = false
        
        let moneyViewTop = NSLayoutConstraint(item: moneyView, attribute: .top, relatedBy: .equal, toItem: self.view, attribute: .top, multiplier: 1.0, constant: 0)
        let moneyViewLeading = NSLayoutConstraint(item: moneyView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let moneyViewTrailing = NSLayoutConstraint(item: moneyView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let moneyViewHeight = NSLayoutConstraint(item: moneyView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 0.28, constant: 0)
        
        self.view.addConstraints([moneyViewTop, moneyViewLeading, moneyViewTrailing, moneyViewHeight])
        
        // Hash View
        self.view.addSubview(hashView)
        hashView.translatesAutoresizingMaskIntoConstraints = false
        
        let hashViewTop = NSLayoutConstraint(item: hashView, attribute: .top, relatedBy: .equal, toItem: moneyView, attribute: .bottom, multiplier: 1.0, constant: 0)
        let hashViewLeading = NSLayoutConstraint(item: hashView, attribute: .leading, relatedBy: .equal, toItem: self.view, attribute: .leading, multiplier: 1.0, constant: 0)
        let hashViewTrailing = NSLayoutConstraint(item: hashView, attribute: .trailing, relatedBy: .equal, toItem: self.view, attribute: .trailing, multiplier: 1.0, constant: 0)
        let hashViewHeight = NSLayoutConstraint(item: hashView, attribute: .height, relatedBy: .equal, toItem: moneyView, attribute: .height, multiplier: 1.3, constant: 0)
        
        self.view.addConstraints([hashViewTop, hashViewLeading, hashViewTrailing, hashViewHeight])
        
        
        // Search Bar Constraints
        
        // Icon Button Constraints
        
    }
    
    func setColors() {
        
        // Money View
        self.moneyView.backgroundColor = ColorController.backgroundGreen
        self.navigationController?.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "navGreen"), for: .default)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName : UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        
        // Hash View
        self.hashView.backgroundColor = ColorController.tintGreen
        
    }
    
    //MARK: - UITextFieldDelegate Functions
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        performCalculation(timeFrame: self.time)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    //MARK: - Calculations
    
    func performCalculation(timeFrame: String) {
        
        guard let hashes = hashrateTextField.text else { NSLog("Hashes text field was nil"); return }
        
        var input = hashes
        
        if self.hashType == "megahashes" {
            input = hashes + "000000"
        }
        if self.hashType == "gigahash" {
            input = hashes + "000000000"
        }
        if self.hashType == "terahash" {
            input = hashes + "000000000000"
        }
        
        CoinController.fetchCoin(for: input) { (coin) in
            guard let coin = coin else { NSLog("Coin was nil"); return }
            
            // Hour timeFrame
            if timeFrame == "hour" {
                
                // Round
                let dollarsPerHourRounded = coin.dollarsPerHour.roundTo(places: 4) // Changed this to 4, good choice?
                let coinsPerHourRounded = coin.coinsPerHour.roundTo(places: 10)
                
                DispatchQueue.main.async {
                    self.usdAmount.text = "$\(dollarsPerHourRounded)"
                    self.currencyAmount.text = "BTC: \(coinsPerHourRounded)"
                }
                NSLog("Hour Calculated")
            }
            
            // Day timeFrame
            if timeFrame == "day" {
                
                // Round
                let dollarsPerDayRounded = coin.dollarsPerDay.roundTo(places: 2)
                let coinsPerDayRounded = coin.coinsPerDay.roundTo(places: 10)
                
                DispatchQueue.main.async {
                    self.usdAmount.text = "$\(dollarsPerDayRounded)"
                    self.currencyAmount.text = "BTC: \(coinsPerDayRounded)"
                }
                NSLog("Day Calculated")
            }
            
            // Week timeFrame
            if timeFrame == "week" {
                
                // Round
                let dollarsPerWeekRounded = coin.dollarsPerWeek.roundTo(places: 2)
                let coinsPerWeekRounded = coin.coinsPerWeek.roundTo(places: 10)
                
                DispatchQueue.main.async {
                    self.usdAmount.text = "$\(dollarsPerWeekRounded)"
                    self.currencyAmount.text = "BTC: \(coinsPerWeekRounded)"
                }
                NSLog("week Calculated")
            }
            
            // Month timeFrame
            
            if timeFrame == "month" {
                
                // Round
                let dollarsPerMonthRounded = coin.dollarsPerMonth.roundTo(places: 2)
                let coinsPerMonthRounded = coin.coinsPerMonth.roundTo(places: 10)
                
                DispatchQueue.main.async {
                    self.usdAmount.text = "$\(dollarsPerMonthRounded)"
                    self.currencyAmount.text = "BTC: \(coinsPerMonthRounded)"
                }
                NSLog("month Calculated")
            }
        }
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var hashrateTextField: UITextField!
    @IBOutlet weak var usdAmount: UILabel!
    @IBOutlet weak var currencyAmount: UILabel!
    //    @IBOutlet weak var mhButton: UIButton!
    
    //MARK: - IBActions
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        self.performCalculation(timeFrame: time)
    }
    
    @IBAction func dayButtonTapped(_ sender: Any) {
        self.time = "day"
        self.performCalculation(timeFrame: time)
    }
    
    @IBAction func hourButtonTapped(_ sender: Any) {
        self.time = "hour"
        self.performCalculation(timeFrame: time)
    }
    
    @IBAction func weekButtonTapped(_ sender: Any) {
        self.time = "week"
        self.performCalculation(timeFrame: time)
    }
    
    @IBAction func monthButtonTapped(_ sender: Any) {
        self.time = "month"
        self.performCalculation(timeFrame: time)
    }
    
    @IBAction func MHButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "hashes, MH's, GH's, or TH's?", message: nil, preferredStyle: .alert)
        
        let hashesAction = UIAlertAction(title: "Hashes", style: .default) { (_) in
            self.hashType = "hashes"
            self.mhButton.titleLabel?.text = "H"
        }
        let megahashesAction = UIAlertAction(title: "MH", style: .default) { (_) in
            self.hashType = "megahashes"
            self.mhButton.titleLabel?.text = "MH"
        }
        let gigahashesAction = UIAlertAction(title: "GH", style: .default) { (_) in
            self.hashType = "gigahash"
            self.mhButton.titleLabel?.text = "GH"
            
        }
        let terahashesAction = UIAlertAction(title: "TH", style: .default) { (_) in
            self.hashType = "terahash"
            self.mhButton.titleLabel?.text = "TH"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(hashesAction)
        alert.addAction(megahashesAction)
        alert.addAction(gigahashesAction)
        alert.addAction(terahashesAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Properties
    
    var time: String = "day"
    var hashType: String = "hashes"
}

//MARK: - Rounding

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


