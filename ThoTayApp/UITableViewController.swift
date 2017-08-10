//
//  UIViewControler.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/10/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation
import UIKit


class CustomUITableViewController: UITableViewController {
    
    func displayAlert ( _ title:String?,_ mess: String?)
    {
        let alert = UIAlertController(title: title, message: mess, preferredStyle: .alert)
        let btn = UIAlertAction(title: "Close", style: .default, handler: nil)
        
        alert.addAction(btn)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
