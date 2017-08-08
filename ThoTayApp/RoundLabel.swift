//
//  RoundLabel.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation
import UIKit

class RoundLabel: UILabel
{
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
    @IBInspectable var cliptoBound:Bool = false {
        didSet {
            self.clipsToBounds = cliptoBound
        }
    }

}
