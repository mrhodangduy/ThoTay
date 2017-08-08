//
//  RoundButton.swift
//  ModalPopup
//
//  Created by QTS Coder on 7/6/17.
//  Copyright © 2017 David. All rights reserved.
//

import UIKit


class RoundButton: UIButton {

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




