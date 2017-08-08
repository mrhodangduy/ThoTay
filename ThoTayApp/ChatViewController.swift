//
//  ChatViewController.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Config Navigation
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target:HomeViewController(), action: #selector(HomeViewController.test))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_menu"), style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        
        
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())

        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
