//
//  CartITableViewCell.swift
//  ThoTayApp
//
//  Created by Paul on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {

    @IBOutlet weak var imageProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblSize: UILabel!
    @IBOutlet weak var lblColor: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblOriginalPrice: UILabel!
    @IBOutlet weak var lblQuanlity: RoundLabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        lblQuanlity.text = "1"
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
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
