//
//  Address.swift
//  ThoTayApp
//
//  Created by Paul on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation


struct AddressBranch {
    let nameBranch:String
    let address:String
    let service:String
    
    init( nameBranch:String, address: String, service:String) {
        self.nameBranch = nameBranch
        self.address = address
        self.service = service
    }
    
}

struct Product {
    let image:UIImage
    let name: String
    let discountPrice:String
    let orginalPrice:String
}
