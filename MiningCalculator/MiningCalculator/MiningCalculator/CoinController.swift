//
//  CoinController.swift
//  MiningCalculator
//
//  Created by Bradley GIlmore on 6/26/17.
//  Copyright © 2017 Bradley Gilmore. All rights reserved.
//

import Foundation

class CoinController {
    
    /*
     - Make and send network request
     - Wait for response as Data
     - Serialize data as json
     - Get card dictionaries
     - Turn those dictionaries into Card objects
     - Return the cards.
     */
    
    static let baseURL = URL(string: "https://alloscomp.com/bitcoin/calculator/json")
    
    static func fetchPokemon(for hashrate: String, completion: @escaping (Coin?) -> Void) {
        
        let searchURL = baseURL?.appendingPathComponent(hashrate)
        guard let url = searchURL else { completion(nil); return }
        
        NetworkController.performRequest(for: url, httpMethod: .get, urlParameters: nil, body: nil) { (data, error) in
            
            if let error = error {
                NSLog("Error performing fetchRequest to API. \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else { completion(nil); return }
            
            guard let jsonDictionary = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String: Any] else {
                NSLog("JSON Serialization failed.")
                completion(nil)
                return
            }
            
            guard let coin = Coin(dictionary: jsonDictionary) else { completion(nil); return }
            completion(coin)
        }
    }
    
}
