//
//  CustomViewOCntroller.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import Foundation


class CustomVC: UIViewController {
    
    func getStart()
    {
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_menu"), style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target: nil, action: #selector(HomeViewController.test))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())

    }
    
}
