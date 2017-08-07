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
        self.navigationBar.setBackgroundImage(#imageLiteral(resourceName: "bg_topbar"), for: .default)
        
        self.navigationItem.setLeftBarButton(UIBarButtonItem.init(image: #imageLiteral(resourceName: "btn_menu"), style: .plain, target: nil, action: nil), animated: false)
        
        self.navigationItem.setRightBarButton(UIBarButtonItem.init(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target: nil, action: nil), animated: false)

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
