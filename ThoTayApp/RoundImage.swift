//
//  RoundImage.swift
//  ThoTayApp
//
//  Created by Paul on 8/10/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation

class RoundImage: UIImageView {
    
    @IBInspectable var conerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = conerRadius
        }
    }
    @IBInspectable var borderWidth:CGFloat = 1 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
        
    }
    
    @IBInspectable var borderColor: UIColor = UIColor.clear {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
}
