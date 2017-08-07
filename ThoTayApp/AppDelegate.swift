//
//  AppDelegate.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
//        let tabbarCon: UITabBarController = UITabBarController()
//        
//        
//        let homeController = HomeViewController()
//        homeController.tabBarItem.title = nil
//        homeController.tabBarItem.image = #imageLiteral(resourceName: "tab_home").withRenderingMode(.alwaysOriginal)
//        homeController.tabBarItem.selectedImage = #imageLiteral(resourceName: "tab_home2").withRenderingMode(.alwaysOriginal)
//        homeController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
//        
//        let homeNaviController = UINavigationController(rootViewController: homeController)
//        homeNaviController.navigationBar.barTintColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_topbar"))
//        homeNaviController.navigationBar.shadowImage = #imageLiteral(resourceName: "ic_product")
//        homeNaviController.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
//        
//        let chatController = ChatViewController()
//        chatController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab_chat").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_chat2").withRenderingMode(.alwaysOriginal))
//        chatController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
//        
//        let chatNaviController = UINavigationController(rootViewController: chatController)
//        chatNaviController.navigationBar.barTintColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_topbar"))
//        chatNaviController.navigationBar.shadowImage = UIImage()
//        chatNaviController.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
//
//        
//        let addressController = AddressViewController()
//        addressController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab_stores").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "menu_hethong2").withRenderingMode(.alwaysOriginal))
//        addressController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
//        let addressNaviController = UINavigationController(rootViewController: addressController)
//        addressNaviController.navigationBar.barTintColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_topbar"))
//        addressNaviController.navigationBar.shadowImage = UIImage()
//        addressNaviController.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
//
//        
//        let callController = CallViewController()
//        callController.tabBarItem = UITabBarItem(title: nil, image: #imageLiteral(resourceName: "tab_chat").withRenderingMode(.alwaysOriginal), selectedImage: #imageLiteral(resourceName: "tab_chat2").withRenderingMode(.alwaysOriginal))
//        callController.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
//        let callNaviController = UINavigationController(rootViewController: callController)
//        callNaviController.navigationBar.barTintColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_topbar"))
//        callNaviController.navigationBar.shadowImage = UIImage()
//        callNaviController.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
//
//        
//
//        tabbarCon.viewControllers = [homeNaviController,chatNaviController,addressNaviController,callNaviController]
//        
//        tabbarCon.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
//        
//        self.window = UIWindow(frame: UIScreen.main.bounds)
//        self.window?.rootViewController = tabbarCon
//        self.window?.makeKeyAndVisible()
        
        return true
    }
    
   
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

