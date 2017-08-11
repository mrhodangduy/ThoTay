//
//  ConvertCurrency.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/11/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation

let currencyLocale = "vi_VN"

class Convert {
    
    func convertToCurrency(number: NSNumber) -> String {
        
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.locale = Locale(identifier: currencyLocale)
        let currency = format.string(from: number)
        let symbol = currency?.components(separatedBy: .whitespaces)
        
         return (symbol?[1])! + " " + (symbol?[0])!
        
    }
    
}
