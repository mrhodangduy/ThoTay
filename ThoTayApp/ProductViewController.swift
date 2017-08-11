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
        
        let product = Product(image: #imageLiteral(resourceName: "ic_product"),name:"SẢN PHẨM THỜI TRANG DEMO 1",discountPrice: 150000, orginalPrice: 180000)
        let product2 = Product(image: #imageLiteral(resourceName: "ic_product1"),name:"SẢN PHẨM THỜI TRANG DEMO 2",discountPrice: 350000, orginalPrice: 1050000)
        let product3 = Product(image: #imageLiteral(resourceName: "ic_detail"),name:"SẢN PHẨM THỜI TRANG DEMO 3",discountPrice: 350000, orginalPrice: 550000)
        
        arrayProduct = [product,product2,product3,product,product2,product2,product3,product]
        
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        
    }
    
    func gotoCart () {
        
        let viewCart = storyboard?.instantiateViewController(withIdentifier: "cartID") as! CartViewController
        
        self.navigationController?.pushViewController(viewCart, animated: true)
        self.navigationController?.modalTransitionStyle = .flipHorizontal
    }
}

extension ProductViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayProduct.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ProductCollectionViewCell
        
        
        
        cell.imageProduct.image = arrayProduct[indexPath.row].image
        cell.lblProductName.text = arrayProduct[indexPath.row].name
        
        let string = Convert()
        let DiscountPrice = string.convertToCurrency(number: arrayProduct[indexPath.row].discountPrice)
        let OrginalPrice = string.convertToCurrency(number: arrayProduct[indexPath.row].discountPrice)
        
        cell.lblDiscountPrice.text = DiscountPrice
        cell.lblOrginalPrice.text = OrginalPrice
        
        cell.lblProductName.adjustsFontSizeToFitWidth = true
        cell.lblOrginalPrice.adjustsFontSizeToFitWidth = true
        cell.lblDiscountPrice.adjustsFontSizeToFitWidth = true
        
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.size.width - 45) / 2 //some width
        let height = (width * 1.5) + CGFloat(50)
        return CGSize(width: width, height: height);
    }
}

