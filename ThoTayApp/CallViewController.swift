//
//  CallViewController.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class CallViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_menu"), style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target: self, action: #selector(CallViewController.gotoCart))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())


        // Do any additional setup after loading the view.
    }

    func gotoCart () {
        
        let viewCart = storyboard?.instantiateViewController(withIdentifier: "cartID") as! CartViewController
        
        self.navigationController?.pushViewController(viewCart, animated: true)
        self.navigationController?.modalTransitionStyle = .flipHorizontal
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
