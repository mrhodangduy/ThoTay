//
//  CartViewController.swift
//  ThoTayApp
//
//  Created by Paul on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit
import MGSwipeTableCell

var arrayProductInCart = [ProdcutInCart]()

class CartViewController: UIViewController {
    
    
    @IBOutlet weak var lblTotalPrice: RoundLabel!
    @IBOutlet weak var cartTableView: UITableView!
    
    var i = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
       
        cartTableView.dataSource = self
        cartTableView.delegate = self
        lblTotalPrice.backgroundColor = #colorLiteral(red: 0.923984766, green: 0.1694104075, blue: 0.5483862758, alpha: 1)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        let string = calTotalPrice()
        lblTotalPrice.text = "TỔNG ĐƠN HÀNG : \(string)"
    }
    
    func calTotalPrice() -> String
    {
        var totalPrice:UInt = 0
        
        for i in 0..<arrayProductInCart.count
        {
            let priceOfItem = UInt(arrayProductInCart[i].discountPrice) * UInt(arrayProductInCart[i].quanlity)
            
            totalPrice = totalPrice + priceOfItem
            print(totalPrice)
            
        }
      
        let totalPriceNSNumber:NSNumber = NSNumber(value: totalPrice)
        let string = Convert()
        return string.convertToCurrency(number: totalPriceNSNumber)
    }
    
    @IBAction func goToCustomerInfp(_ sender: Any) {
        let viewCustomer = storyboard?.instantiateViewController(withIdentifier: "customerInfo") as! CustomerInfoViewController
        let string = calTotalPrice()
        viewCustomer.totalPrice = string
        self.navigationController?.pushViewController(viewCustomer, animated: true)
    }
    
}

extension CartViewController: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayProductInCart.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! New_CartTableViewCell
        
        let item = arrayProductInCart[indexPath.row]
        cell.imageProduct.image = item.image
        cell.lblProductName.text = item.nameItem
        cell.lblSize.text = "Size: \(item.size)"
        cell.lblColor.text = "Color: \(item.color)"
        
        let string = Convert()
        let DiscountPrice = string.convertToCurrency(number: item.discountPrice)
        let OrginalPrice = string.convertToCurrency(number: item.orginalPrice)
        
        cell.lblDiscountPrice.text = DiscountPrice
        cell.lblOriginalPrice.text = OrginalPrice
        cell.lblQuanlity.text = String(item.quanlity)
        cell.index = indexPath.row
        
        cell.lblProductName.adjustsFontSizeToFitWidth = true
        cell.lblSize.adjustsFontSizeToFitWidth = true
        cell.lblColor.adjustsFontSizeToFitWidth = true
        cell.lblDiscountPrice.adjustsFontSizeToFitWidth = true
        cell.lblOriginalPrice.adjustsFontSizeToFitWidth = true
        
        // Create del Icon when swipe by MGSwipe Lib
        
        cell.rightButtons = [MGSwipeButton(title: "", icon: #imageLiteral(resourceName: "ic_del").withRenderingMode(.alwaysOriginal), backgroundColor: #colorLiteral(red: 0.9445316792, green: 0.2186656296, blue: 0.6175296903, alpha: 1), insets: UIEdgeInsets.init(top: 0, left: 25, bottom: 0, right: 25), callback: { (del) -> Bool in
            
            arrayProductInCart.remove(at: indexPath.row)
            self.cartTableView.reloadData()
            return true
            
        })]
        
        cell.rightSwipeSettings.transition = .rotate3D
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Int((((self.view.frame.size.width / 3) * 1.3) + CGFloat(20))))
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
