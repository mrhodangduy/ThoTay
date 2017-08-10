//
//  OrderButtonTableViewCell.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/10/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class OrderButtonTableViewCell: UITableViewCell {
    
    @IBAction func OerderAction(_ sender: Any) {
        
        print("Ordered")

    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
