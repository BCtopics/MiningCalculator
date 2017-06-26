//
//  Coin.swift
//  MiningCalculator
//
//  Created by Bradley GIlmore on 6/26/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class Coin {
    
    //MARK: - Keys
    let kDollarHour = "dollars_per_hour"
    
    
    //MARK: - Initializers
    
    init(dollarsPerHour: Double) {
        self.dollarsPerHour = dollarsPerHour
        self.dollarsPerDay = dollarsPerHour * 24
        self.dollarsPerWeek = dollarsPerDay * 7
        self.dollarsPerMonth = dollarsPerWeek * 4
    }
    
    init?(dictionary: [String : Any]) {
        guard let dollarsPerHour = dictionary[kDollarHour] as? Double else { NSLog("Failable Initializer has failed"); return nil;}
        
        // Make this call other initializer later
        self.dollarsPerHour = dollarsPerHour
        self.dollarsPerDay = dollarsPerHour * 24
        self.dollarsPerWeek = dollarsPerDay * 7
        self.dollarsPerMonth = dollarsPerWeek * 4
        
    }
    
    //MARK: - Properties
    var dollarsPerHour: Double
    var dollarsPerDay: Double
    var dollarsPerWeek: Double
    var dollarsPerMonth: Double
}
