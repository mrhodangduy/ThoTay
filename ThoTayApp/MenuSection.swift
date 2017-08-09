//
//  MenuSection.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/9/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation
import UIKit

struct Menu {
    var name:String
    var items:[String]
    var collapsed: Bool
    
    init(name:String, items:[String], collapsed:Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = collapsed
    }
}



