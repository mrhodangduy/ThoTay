//
//  ProductViewController.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productCollectionView: UICollectionView!
    
    var arrayProduct = [Product]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        productCollectionView.contentInset = UIEdgeInsets(top: -44, left: 0, bottom: -44, right: 0)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target:self, action: #selector(ProductViewController.gotoCart))
        
        let product = Product(image: #imageLiteral(resourceName: "ic_product"),name:"SẢN PHẨM THỜI TRANG DEMO 1",discountPrice: "150.000 đ", orginalPrice: "180.000 đ")
        
        
        arrayProduct = [Product](repeating: product, count: 10)
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
        

      
    }
    
    func gotoCart () {
        
        let viewCart = storyboard?.instantiateViewController(withIdentifier: "cartID") as! CartViewController
        
        self.navigationController?.pushViewController(viewCart, animated: true)
        self.navigationController?.modalTransitionStyle = .flipHorizontal
    }
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayProduct.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        cell.imageProduct.image = arrayProduct[indexPath.row].image
        cell.lblProductName.text = arrayProduct[indexPath.row].name
        cell.lblDiscountPrice.text = arrayProduct[indexPath.row].discountPrice
        cell.lblOrginalPrice.text = arrayProduct[indexPath.row].orginalPrice
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(arrayProduct[indexPath.row])
        
        let detailView = storyboard?.instantiateViewController(withIdentifier: "detailsProduct") as! DetailProductViewController
        
        detailView.productname = arrayProduct[indexPath.row].name
        detailView.discountPrice = arrayProduct[indexPath.row].discountPrice
        detailView.orginalPrice = arrayProduct[indexPath.row].orginalPrice
        detailView.image = arrayProduct[indexPath.row].image
        
        self.navigationController?.pushViewController(detailView, animated: true)
        
    }
}










