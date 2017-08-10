//
//  CustomNavigationController.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class CustomNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationBar.tintColor = UIColor.black
        self.navigationBar.shadowImage  = UIImage()
//        self.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "bg_topbar"), for: .default)
        self.navigationBar.barTintColor = #colorLiteral(red: 0.9445296526, green: 0.2091335058, blue: 0.5810018182, alpha: 1)
        self.navigationBar.backIndicatorImage = UIImage(named: "btn_back")?.withRenderingMode(.alwaysOriginal)
        self.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "btn_back").withRenderingMode(.alwaysOriginal)
        
   
    }

  
    
}
