//
//  New_CartTableViewCell.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/9/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import MGSwipeTableCell

class New_CartTableViewCell: MGSwipeTableCell {
    
    @IBOutlet weak var imageProduct: UIImageView!
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblQuanlity: RoundLabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    
    @IBOutlet weak var AddButton: UIButton!    
    @IBOutlet weak var MinusButton: UIButton!
    
    
    var index:Int?
    var newPrice:String?
    
    func calTotalPrice() -> String
    {
        var totalPrice:UInt = 0
        
        for i in 0..<arrayProductInCart.count
        {
            let priceOfItem = UInt(arrayProductInCart[i].discountPrice) * UInt(arrayProductInCart[i].quanlity)
            
            totalPrice = totalPrice + priceOfItem
            
        }
        
        let totalPriceNSNumber:NSNumber = NSNumber(value: totalPrice)
        let string = Convert()
        return string.convertToCurrency(number: totalPriceNSNumber)
    }
    
    @IBAction func IncreaseQuanlityButton(_ sender: UIButton) {
        
        lblQuanlity.text = String(Int(lblQuanlity.text!)! + 1)
        arrayProductInCart[index!].quanlity = Int(lblQuanlity.text!)!
        newPrice = calTotalPrice()
        
    }
  
    @IBAction func DeincreaseQuanlityButton(_ sender: UIButton) {
        
        if Int(lblQuanlity.text!)! > 0
        {
            lblQuanlity.text = String(Int(lblQuanlity.text!)! - 1)
            arrayProductInCart[index!].quanlity = Int(lblQuanlity.text!)!
            newPrice = calTotalPrice()

            
        } else
        {
            lblQuanlity.text = "0"
            arrayProductInCart[index!].quanlity = Int(lblQuanlity.text!)!
            newPrice = calTotalPrice()

        }
        
    }
    
    
}
