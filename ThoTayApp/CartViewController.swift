//
//  CartViewController.swift
//  ThoTayApp
//
//  Created by Paul on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    var arrayProductInCart = [ProdcutInCart]()
    
    @IBOutlet weak var cartTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(arrayProductInCart)
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target:self, action: nil)
        
        cartTableView.dataSource = self
        cartTableView.delegate = self
        
        
        let item1 = ProdcutInCart(image: #imageLiteral(resourceName: "ic_product"), nameItem: "SẢN PHẨM THỜI TRANG DEMO 1", discountPrice: "180.000 đ", orginalPrice: "190.000 đ", size: "S", color: "Red")
        let item2 = ProdcutInCart(image: #imageLiteral(resourceName: "ic_detail"), nameItem: "SẢN PHẨM THỜI TRANG DEMO 2", discountPrice: "180.000 đ", orginalPrice: "190.000 đ", size: "M", color: "Green")
        let item3 = ProdcutInCart(image: #imageLiteral(resourceName: "ic_product1"), nameItem: "SẢN PHẨM THỜI TRANG DEMO 3", discountPrice: "180.000 đ", orginalPrice: "190.000 đ", size: "XL", color: "Blue")
        
        arrayProductInCart.append(item1)
        arrayProductInCart.append(item2)
        arrayProductInCart.append(item3)
        
        print(arrayProductInCart)
        print("Hu hu hu")
        
        
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProductInCart.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        
        let item = arrayProductInCart[indexPath.row]
        
        cell.imageProduct.image = item.image
        cell.lblProductName.text = item.nameItem
        cell.lblSize.text = "Size: \(item.size)"
        cell.lblColor.text = "Color: \(item.color)"
        cell.lblDiscountPrice.text = item.discountPrice
        cell.lblOriginalPrice.text = item.orginalPrice
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action, indexPath) in
            
            self.arrayProductInCart.remove(at: indexPath.row)
            self.cartTableView.reloadData()
            
        }
        delete.backgroundColor = #colorLiteral(red: 0.9445316792, green: 0.2186656296, blue: 0.6175296903, alpha: 1)
        
        
        return [delete]
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.cartTableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
   
    
}
