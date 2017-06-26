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
    
    func performCalculation() {
        
        // Check which dropdown box was selected... MH/HG/TH
        // Perform conversion to Hashes
        
        guard let hashes = hashrateTextField.text else { NSLog("Hashes text field was nil"); return }
        CoinController.fetchCoin(for: hashes) { (coin) in
            guard let coin = coin else { NSLog("Coin was nil"); return }
                let perDayRounded = coin.dollarsPerDay.roundTo(places: 2)
            DispatchQueue.main.async {
                self.usdAmount.text = "$\(perDayRounded)"
            }
        }
    }
    
    //MARK: - IBOutlets
    
    @IBOutlet weak var hashrateTextField: UITextField!
    @IBOutlet weak var usdAmount: UILabel!
    @IBOutlet weak var currencyAmount: UILabel!
    
    //MARK: - IBActions
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        self.performCalculation()
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
