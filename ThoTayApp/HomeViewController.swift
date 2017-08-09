//
//  HomeViewController.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

/// http://www.iosinsight.com/uinavigationcontroller-inside-uitabbarcontroller-with-storyboard/

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeTableView: UITableView!
    
    let arrayImages:[UIImage] = [#imageLiteral(resourceName: "banner1"), #imageLiteral(resourceName: "banner2"),#imageLiteral(resourceName: "banner3")]
    let arrayCategories:[UIImage] = [UIImage](repeatElement(#imageLiteral(resourceName: "ic_category"), count: 10))
    
    
    var contentHeight: CGFloat = 1000
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_menu"), style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target: self, action: #selector(HomeViewController.gotoCart))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.contentInset = UIEdgeInsets(top: -44, left: 0, bottom: 0, right: 0)
        
        
        
    }
    
    func gotoCart () {
        
        let viewCart = storyboard?.instantiateViewController(withIdentifier: "cartID") as! CartViewController
        
        self.navigationController?.pushViewController(viewCart, animated: true)
        self.navigationController?.modalTransitionStyle = .flipHorizontal
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 2
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellDefault = UITableViewCell()
        
        switch indexPath.row {
            
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! HomeTableViewCell
            
            cell.bannerCollection.reloadData()
            cell.bannerCollection.delegate = self
            cell.bannerCollection.dataSource = self
            cell.pageController.numberOfPages = arrayImages.count
            
            
            
            cell.bannerCollection.tag = indexPath.row
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! CategoriesTableViewCell
            cell.backgroundColor = UIColor.black
            
            
            cell.categoriesCollectionView.reloadData()
            cell.categoriesCollectionView.dataSource = self
            cell.categoriesCollectionView.delegate = self
            
            cell.categoriesCollectionView.tag = indexPath.row
            
            return cell
            
        default:
            
            return cellDefault
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0
        {
            return self.view.frame.size.width/2
        }
        else if indexPath.row == 1
        {
            return contentHeight
            
        } else
        {
            return 0
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let dataSource = collectionView.tag
        
        if dataSource == 0
        {
            return arrayImages.count
        }
        else if dataSource == 1
        {
            return arrayCategories.count
        }
        else
        {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellDefault = UICollectionViewCell()
        
        let dataSource = collectionView.tag
        
        if dataSource == 0
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! HomeCollectionViewCell
            
            cell.imageBanner.image = arrayImages[indexPath.row]
            
            return cell
        }
        else if dataSource == 1
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoriesCell", for: indexPath) as! CatgoriesCollectionViewCell
            
            cell.imageCategories.image = arrayCategories[indexPath.row]
            cell.imageCategories.layer.cornerRadius = 8
            cell.imageCategories.clipsToBounds = true
            
            
            return cell
            
        }
        else
        {
            return cellDefault
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}












