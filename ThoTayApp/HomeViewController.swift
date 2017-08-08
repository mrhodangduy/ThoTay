//
//  HomeViewController.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    let arrayImages:[UIImage] = [#imageLiteral(resourceName: "banner1"), #imageLiteral(resourceName: "banner2"),#imageLiteral(resourceName: "banner3")]
    let arrayCategories:[UIImage] = [UIImage](repeatElement(#imageLiteral(resourceName: "ic_category"), count: 10))

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_menu"), style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target: self, action: #selector(HomeViewController.test))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.contentInset = UIEdgeInsets(top: -44, left: 0, bottom: 0, right: 0)
        homeTableView.estimatedRowHeight = self.view.frame.width/2
        homeTableView.rowHeight = UITableViewAutomaticDimension
        
    }
    
    func test () {
        
        print("Cart")
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return 1
    
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
//        if indexPath.row == 0
//        {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! HomeTableViewCell
//            
//            cell.bannerCollection.reloadData()
//            cell.bannerCollection.delegate = self
//            cell.bannerCollection.dataSource = self
//            cell.pageController.numberOfPages = arrayImages.count
//            cell.pageController.currentPage = indexPath.row
//            
//            cell.bannerCollection.tag = indexPath.row
//            
//            return cell
//        }
//        else
//        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CategoriesTableViewCell
            
            cell.categoriesCollectionView.reloadData()
            cell.categoriesCollectionView.dataSource = self
            cell.categoriesCollectionView.delegate = self
            
            cell.categoriesCollectionView.tag = indexPath.row
        
            return cell
//        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 1
        {
        return self.view.frame.size.width/2
        }
        else
        {
            return 600
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return arrayCategories.count
        
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CatgoriesCollectionViewCell
        
        cell.imageCategories.image = arrayCategories[indexPath.row]
        cell.imageCategories.layer.cornerRadius = 8
        cell.imageCategories.clipsToBounds = true
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}












