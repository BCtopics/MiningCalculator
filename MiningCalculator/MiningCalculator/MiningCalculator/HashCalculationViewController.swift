//
//  HashCalculationViewController.swift
//  MiningCalculator
//
//  Created by Bradley GIlmore on 6/26/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import UIKit

class HashCalculationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Calculations
    
    func performCalculation(timeFrame: String) {
        
        // Check which dropdown box was selected... MH/HG/TH
        // Perform conversion to Hashes
        
        guard let hashes = hashrateTextField.text else { NSLog("Hashes text field was nil"); return }
        CoinController.fetchCoin(for: hashes) { (coin) in
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
    
    //MARK: - Properties 
    
    var time: String = "day"
    
}

//MARK: - Rounding

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
