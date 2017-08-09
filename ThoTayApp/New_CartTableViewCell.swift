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
    
    @IBAction func IncreaseQuanlityButton(_ sender: UIButton) {
        
        lblQuanlity.text = String(Int(lblQuanlity.text!)! + 1)
    }
    @IBAction func DeincreaseQuanlityButton(_ sender: UIButton) {
        
        if Int(lblQuanlity.text!)! > 0
        {
            lblQuanlity.text = String(Int(lblQuanlity.text!)! - 1)
            
        } else
        {
            lblQuanlity.text = "0"
        }

    }
    
    
}
