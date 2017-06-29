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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hashrateSearchField.becomeFirstResponder()
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
        self.hashrateSearchField.textAlignment = .left
        self.hashrateSearchField.setContentHuggingPriority(249, for: UILayoutConstraintAxis.horizontal)
        self.hashrateSearchField.keyboardType = .decimalPad
        self.hashrateSearchField.textColor = ColorController.textOrange
        self.hashrateSearchField.becomeFirstResponder()
        self.hashrateSearchField.setBottomBorder()
        self.hashrateSearchField.tintColor = ColorController.textOrange
        
        self.mhButton.setTitle("TH's", for: .normal)
        self.mhButton.setTitleColor(ColorController.textOrange, for: .normal)
        
        self.hashView.addSubview(hashrateSearchField)
        self.hashView.addSubview(mhButton)
        
        // btcIcon Button Setup
        
        self.btcIcon.setImage(#imageLiteral(resourceName: "bitcoin"), for: .normal)
        self.hashView.addSubview(btcIcon)
        
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
        
        // btcIcon Button Constraints
        btcIcon.translatesAutoresizingMaskIntoConstraints = false
        
        let btcIconAspectRatio = NSLayoutConstraint(item: btcIcon, attribute: .height, relatedBy: .equal, toItem: btcIcon, attribute: .width, multiplier: 1.0, constant: 0)
        let btcIconLeading = NSLayoutConstraint(item: btcIcon, attribute: .leading, relatedBy: .equal, toItem: hashView, attribute: .leading, multiplier: 1.0, constant: 120)
        let btcIconTrailing = NSLayoutConstraint(item: btcIcon, attribute: .trailing, relatedBy: .equal, toItem: hashView, attribute: .trailing, multiplier: 1.0, constant: -120)
        let btcIconBottom = NSLayoutConstraint(item: btcIcon, attribute: .bottom, relatedBy: .equal, toItem: hashView, attribute: .bottom, multiplier: 1.0, constant: -65)
        
        self.hashView.addConstraints([btcIconLeading, btcIconTrailing, btcIconAspectRatio, btcIconBottom])
        
        hashTargets()
    }
    
    func hashTargets() {
        mhButton.addTarget(self, action: #selector(MHButtonTapped(_:)), for: .touchUpInside)
        btcIcon.addTarget(self, action: #selector(calculateButtonTapped(_:)), for: .touchUpInside)
        btcIcon.addTarget(self, action: #selector(coinSpin(_:)), for: .touchUpInside)
    }
    
    //MARK: - Money View
    
    // Money Amounts
    let usdLabel = UILabel()
    let cryptoAmountLabel = UILabel()
    
    // Hour, Day, Week, Month, Year stackview
    
    let timeStackView = UIStackView()
    
    let hourButton = UIButton(type: .system)
    let dayButton = UIButton(type: .system)
    let weekButton = UIButton(type: .system)
    let monthButton = UIButton(type: .system)
    
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
        self.hourButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)

        // Day
        self.dayButton.setTitle("Day", for: .normal)
        self.dayButton.setTitleColor(ColorController.textOrange, for: .normal)
        self.timeStackView.addArrangedSubview(dayButton)
        self.dayButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        // Week
        self.weekButton.setTitle("Week", for: .normal)
        self.weekButton.setTitleColor(ColorController.textOrange, for: .normal)
        self.timeStackView.addArrangedSubview(weekButton)
        self.weekButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        // Month
        self.monthButton.setTitle("Month", for: .normal)
        self.monthButton.setTitleColor(ColorController.textOrange, for: .normal)
        self.timeStackView.addArrangedSubview(monthButton)
        self.monthButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
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
    
        let timeStackViewTop = NSLayoutConstraint(item: timeStackView, attribute: .top, relatedBy: .equal, toItem: cryptoAmountLabel, attribute: .bottom, multiplier: 1.0, constant: 18) //FIXME: - Constant was 10
        let timeStackViewTrailing = NSLayoutConstraint(item: timeStackView, attribute: .trailing, relatedBy: .equal, toItem: moneyView, attribute: .trailing, multiplier: 1.0, constant: -30)
        let timeStackViewLeading = NSLayoutConstraint(item: timeStackView, attribute: .leading, relatedBy: .equal, toItem: moneyView, attribute: .leading, multiplier: 1.0, constant: 30)
        
        self.moneyView.addConstraints([timeStackViewTop, timeStackViewLeading, timeStackViewTrailing])
        
        moneyTargets()
    }
    
    func moneyTargets() {
        hourButton.addTarget(self, action: #selector(hourButtonTapped(_:)), for: .touchUpInside)
        dayButton.addTarget(self, action: #selector(dayButtonTapped(_:)), for: .touchUpInside)
        weekButton.addTarget(self, action: #selector(weekButtonTapped(_:)), for: .touchUpInside)
        monthButton.addTarget(self, action: #selector(monthButtonTapped(_:)), for: .touchUpInside)
        
        hourButton.addTarget(self, action: #selector(buttonShake(_:)), for: .touchUpInside)
        dayButton.addTarget(self, action: #selector(buttonShake(_:)), for: .touchUpInside)
        weekButton.addTarget(self, action: #selector(buttonShake(_:)), for: .touchUpInside)
        monthButton.addTarget(self, action: #selector(buttonShake(_:)), for: .touchUpInside)
    }
    
    //MARK: - Default Setup
    
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
        let hashViewHeight = NSLayoutConstraint(item: hashView, attribute: .height, relatedBy: .equal, toItem: moneyView, attribute: .height, multiplier: 1.7, constant: 0) // Was 1.3
        
        self.view.addConstraints([hashViewTop, hashViewLeading, hashViewTrailing, hashViewHeight])
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
    
    //MARK: - Calculations
    
    func performCalculation(timeFrame: String) {
        
        guard let hashes = hashrateSearchField.text else { NSLog("Hashes text field was nil"); return }
        
        var input = hashes
        
        if self.hashType == "megahashes" {
            input = hashes + "000000"
        }
        if self.hashType == "gigahashes" {
            input = hashes + "000000000"
        }
        if self.hashType == "terahashes" {
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
                    self.usdLabel.text = "$\(dollarsPerHourRounded)"
                    self.cryptoAmountLabel.text = "BTC: \(coinsPerHourRounded)"
                }
                NSLog("Hour Calculated")
            }
            
            // Day timeFrame
            if timeFrame == "day" {
                
                // Round
                let dollarsPerDayRounded = coin.dollarsPerDay.roundTo(places: 2)
                let coinsPerDayRounded = coin.coinsPerDay.roundTo(places: 10)
                
                DispatchQueue.main.async {
                    self.usdLabel.text = "$\(dollarsPerDayRounded)"
                    self.cryptoAmountLabel.text = "BTC: \(coinsPerDayRounded)"
                }
                NSLog("Day Calculated")
            }
            
            // Week timeFrame
            if timeFrame == "week" {
                
                // Round
                let dollarsPerWeekRounded = coin.dollarsPerWeek.roundTo(places: 2)
                let coinsPerWeekRounded = coin.coinsPerWeek.roundTo(places: 10)
                
                DispatchQueue.main.async {
                    self.usdLabel.text = "$\(dollarsPerWeekRounded)"
                    self.cryptoAmountLabel.text = "BTC: \(coinsPerWeekRounded)"
                }
                NSLog("week Calculated")
            }
            
            // Month timeFrame
            
            if timeFrame == "month" {
                
                // Round
                let dollarsPerMonthRounded = coin.dollarsPerMonth.roundTo(places: 2)
                let coinsPerMonthRounded = coin.coinsPerMonth.roundTo(places: 10)
                
                DispatchQueue.main.async {
                    self.usdLabel.text = "$\(dollarsPerMonthRounded)"
                    self.cryptoAmountLabel.text = "BTC: \(coinsPerMonthRounded)"
                }
                NSLog("month Calculated")
            }
        }
    }
    
    //MARK: - Animations
    
    func buttonShake(_ sender: UIButton) {
        
        view.bringSubview(toFront: sender)
        let animation = CAKeyframeAnimation()
        animation.keyPath = "position.x"
        animation.values = [
            sender.frame.origin.x + sender.frame.width / 2,
            sender.frame.origin.x + sender.frame.width / 2 - 15,
            sender.frame.origin.x + sender.frame.width / 2,
            sender.frame.origin.x + sender.frame.width / 2 + 15,
            sender.frame.origin.x + sender.frame.width / 2
        ]
        animation.keyTimes = [0, 0.25, 0.5, 0.75, 1]
        animation.duration = 0.5
        animation.repeatCount = 1
        sender.layer.add(animation, forKey: "shake")
    }

    func coinSpin(_ sender: UIButton) {
    
        UIView.animate(withDuration: 0.5) { () -> Void in
            
            self.btcIcon.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        }
        
        UIView.animate(withDuration: 0.5, delay: 0.45, options: UIViewAnimationOptions.curveEaseIn, animations: { () -> Void in
            
            self.btcIcon.transform = CGAffineTransform(rotationAngle: CGFloat.pi * 2.0)
        }, completion: nil)
    }
    
    func bounce() {
        //FIXME: - Bug when you select the same one twice.
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [], animations: ({
            self.mhButton.center.y = self.view.frame.height / 4
        }), completion: nil)
        UIView.animate(withDuration: 0.7, delay: 0.2, usingSpringWithDamping: 1, initialSpringVelocity: 0.8, options: [], animations: ({
            self.mhButton.center.y = self.view.frame.height / 6
        }), completion: nil)
        UIView.animate(withDuration: 0.9, delay: 0.4, usingSpringWithDamping: 1, initialSpringVelocity: 0.6, options: [], animations: ({
            self.mhButton.center.y = self.view.frame.height / 4
        }), completion: nil)
        UIView.animate(withDuration: 1, delay: 0.6, usingSpringWithDamping: 1, initialSpringVelocity: 0.4, options: [], animations: ({
            self.mhButton.center.y = self.view.frame.height / 5.5
        }), completion: nil)
        UIView.animate(withDuration: 1.05, delay: 0.8, usingSpringWithDamping: 1, initialSpringVelocity: 0.2, options: [], animations: ({
            self.mhButton.center.y = self.view.frame.height / 4
        }), completion: nil)
    }
    
    //MARK: - IBActions
    
    func calculateButtonTapped(_ sender: Any) {
        self.performCalculation(timeFrame: time)
    }
    
    func dayButtonTapped(_ sender: Any) {
        self.time = "day"
        self.performCalculation(timeFrame: time)
        self.dayButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.hourButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.weekButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.monthButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    
    func hourButtonTapped(_ sender: Any) {
        self.time = "hour"
        self.performCalculation(timeFrame: time)
        self.hourButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.dayButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.weekButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.monthButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    
    func weekButtonTapped(_ sender: Any) {
        self.time = "week"
        self.performCalculation(timeFrame: time)
        self.weekButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.dayButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.hourButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.monthButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    
    func monthButtonTapped(_ sender: Any) {
        self.time = "month"
        self.performCalculation(timeFrame: time)
        self.monthButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        self.dayButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.weekButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        self.hourButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)
    }
    
    func MHButtonTapped(_ sender: Any) {
        
        let alert = UIAlertController(title: "H's, MH's, GH's, or TH's?", message: nil, preferredStyle: .alert)
        
        let hashesAction = UIAlertAction(title: "H", style: .default) { (_) in
            self.hashType = "hashes"
            self.mhButton.setTitle("H's", for: .normal)
            self.hashrateSearchField.placeholder = "Enter Hashrate in \(self.hashType)..."
        }
        let megahashesAction = UIAlertAction(title: "MH", style: .default) { (_) in
            self.hashType = "megahashes"
            self.mhButton.setTitle("MH's", for: .normal)
            self.hashrateSearchField.placeholder = "Enter Hashrate in \(self.hashType)..."
        }
        let gigahashesAction = UIAlertAction(title: "GH", style: .default) { (_) in
            self.hashType = "gigahashes"
            self.mhButton.setTitle("GH's", for: .normal)
            self.hashrateSearchField.placeholder = "Enter Hashrate in \(self.hashType)..."
            
        }
        let terahashesAction = UIAlertAction(title: "TH", style: .default) { (_) in
            self.hashType = "terahashes"
            self.mhButton.setTitle("TH's", for: .normal)
            self.hashrateSearchField.placeholder = "Enter Hashrate in \(self.hashType)..."
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
    var hashType: String = "terahashes" {
        didSet {
            bounce()
        }
    }
}

//MARK: - Rounding

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension UITextField {
    func setBottomBorder() {
        self.borderStyle = .none
        self.layer.backgroundColor = ColorController.tintGreen.cgColor
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = ColorController.underLineGray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
