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
    let discountPrice:NSNumber
    let orginalPrice:NSNumber
}

struct ProdcutInCart {
    
    let image:UIImage
    let nameItem: String
    let discountPrice:NSNumber
    let orginalPrice:NSNumber
    let size: String
    let color:String
    var quanlity:Int
    
    init(image: UIImage, nameItem:String,discountPrice:NSNumber,orginalPrice:NSNumber,size: String,color:String,quanlity:Int = 1) {
        
        self.image = image
        self.nameItem = nameItem
        self.discountPrice = discountPrice
        self.orginalPrice = orginalPrice
        self.color = color
        self.size = size
        self.quanlity = quanlity
    }

}




