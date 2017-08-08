//
//  DetailProductViewController.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    @IBOutlet weak var sizeCollectionView: UICollectionView!
    @IBOutlet weak var colorCollectionView: UICollectionView!
    @IBOutlet weak var prouctImageCollectionView: UICollectionView!
    
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblDiscountPrice: UILabel!
    @IBOutlet weak var lblOrginalPrice: UILabel!
    
    let arraySize = ["S","M","L","XL","XXL"]
    let arrColor:[UIColor] = [#colorLiteral(red: 0.2811203003, green: 0.7406486273, blue: 0.3002577424, alpha: 1),#colorLiteral(red: 0.9267657995, green: 0.5720303655, blue: 0.02264489233, alpha: 1),#colorLiteral(red: 0.9086088538, green: 0.1588474512, blue: 0.3089841306, alpha: 1),#colorLiteral(red: 0.2562428415, green: 0.4528628588, blue: 0.9696893096, alpha: 1),#colorLiteral(red: 0.3263745308, green: 0.767450273, blue: 0.7863391042, alpha: 1)]
    
    var selectIndexSize = 1
    var selectIndexColor = 0
    
    var arrayProductImage = [UIImage]()
    var image = UIImage()
    var productname = ""
    var discountPrice = ""
    var orginalPrice = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        prouctImageCollectionView.delegate = self
        prouctImageCollectionView.dataSource = self
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target:HomeViewController(), action: #selector(HomeViewController.test))
        
        lblProductName.text = productname
        lblDiscountPrice.text = discountPrice
        lblOrginalPrice.text = orginalPrice
        arrayProductImage.append(#imageLiteral(resourceName: "ic_detail"))
        arrayProductImage.append(image)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btn_AddToCart(_ sender: Any) {
        
    }
    
}

extension DetailProductViewController: UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.sizeCollectionView
        {
            return arraySize.count
            
        }
        else if collectionView == self.colorCollectionView
        {
            return arrColor.count
            
        } else if collectionView == self.prouctImageCollectionView
        {
            return arrayProductImage.count
        }
        else
        {
            return 0
        }
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = UICollectionViewCell()
        
        if collectionView == self.sizeCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellsize", for: indexPath) as! SizeCollectionViewCell
            
            cell.lblSize.text = arraySize[indexPath.row]
            
            if selectIndexSize == indexPath.row
            {
                cell.lblSize.backgroundColor = #colorLiteral(red: 0.9445316792, green: 0.2186656296, blue: 0.6175296903, alpha: 1)
                cell.lblSize.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else
            {
                cell.lblSize.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                cell.lblSize.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
                
            }
            
            return cell
        }
        else if collectionView == self.colorCollectionView
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellcolor", for: indexPath) as! ColorCollectionViewCell
            
            cell.lblColor.backgroundColor = arrColor[indexPath.row]
            
            if selectIndexColor == indexPath.row
            {
                
                let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
                button.layer.cornerRadius = 16
                button.layer.borderWidth = 0.7
                button.layer.borderColor = arrColor[selectIndexColor].cgColor
                
                
                cell.addSubview(button)
                
                
                
            }
            else
            {
                
            }
            
            
            return cell
            
        }
        else if collectionView == self.prouctImageCollectionView
            
        {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellimage", for: indexPath) as! productImageCollectionViewCell
            
            cell.productImage.image = arrayProductImage[indexPath.row]
            
            return cell
        }
            
        else
        {
            return cell
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.sizeCollectionView
        {
            selectIndexSize = indexPath.row
            self.sizeCollectionView.reloadData()
        }
        else if collectionView == self.colorCollectionView
        {
            selectIndexColor = indexPath.row
            print(selectIndexColor)
            self.colorCollectionView.reloadData()
        }
        
    }
    
}
