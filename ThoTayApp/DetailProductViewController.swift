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
    @IBOutlet weak var pageController: UIPageControl!
    
    let arraySize = ["S","M","L","XL","XXL"]
    let arrColor:[UIColor] = [#colorLiteral(red: 0.2811203003, green: 0.7406486273, blue: 0.3002577424, alpha: 1),#colorLiteral(red: 0.9267657995, green: 0.5720303655, blue: 0.02264489233, alpha: 1),#colorLiteral(red: 0.9086088538, green: 0.1588474512, blue: 0.3089841306, alpha: 1),#colorLiteral(red: 0.2562428415, green: 0.4528628588, blue: 0.9696893096, alpha: 1),#colorLiteral(red: 0.3263745308, green: 0.767450273, blue: 0.7863391042, alpha: 1)]
    let arrColorText:[String] = ["Green","Organe","Red","Blue","Cyan"]
    
    var selectIndexSize = 1
    var selectIndexColor = 2
    
    var arrayProductImage = [UIImage]()
    var image = UIImage()
    var productname = ""
    var discountPrice = ""
    var orginalPrice = ""
    
    
    var thisWidth:CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizeCollectionView.delegate = self
        sizeCollectionView.dataSource = self
        colorCollectionView.delegate = self
        colorCollectionView.dataSource = self
        prouctImageCollectionView.delegate = self
        prouctImageCollectionView.dataSource = self
        
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target:self, action: #selector(DetailProductViewController.gotoCart))
        
        lblProductName.text = productname
        lblDiscountPrice.text = discountPrice
        lblOrginalPrice.text = orginalPrice
        arrayProductImage.append(#imageLiteral(resourceName: "ic_detail"))
        arrayProductImage.append(#imageLiteral(resourceName: "ic_product1"))
        arrayProductImage.append(image)
        
        
        pageController.hidesForSinglePage = true
        pageController.numberOfPages = arrayProductImage.count
        pageController.currentPageIndicatorTintColor = #colorLiteral(red: 0.9445296526, green: 0.2091335058, blue: 0.5810018182, alpha: 1)
        pageController.pageIndicatorTintColor = UIColor.white
        thisWidth = CGFloat(self.view.frame.width)
        
        
    }
    
    func gotoCart () {
        
        let viewCart = storyboard?.instantiateViewController(withIdentifier: "cartID") as! CartViewController
        
        self.navigationController?.pushViewController(viewCart, animated: true)
        self.navigationController?.modalTransitionStyle = .flipHorizontal
    }
    
    @IBAction func addItemToCart(_ sender: UIButton) {
        
        let newImage:UIImage = image
        let name = productname
        let discount = discountPrice
        let original = orginalPrice
        let size = arraySize[selectIndexSize]
        let color = arrColorText[selectIndexColor]
        
        let item = ProdcutInCart(image: newImage, nameItem: name, discountPrice: discount, orginalPrice: original, size: size, color: color)
        
        arrayProductInCart.append(item)
        
        print("Added to Cart")
        
        
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

extension DetailProductViewController: UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat  = prouctImageCollectionView.frame.size.width
        let x = prouctImageCollectionView.contentOffset.x
        let currentPage = Int(ceil(x/pageWidth))
        pageController.currentPage = (currentPage)
        print("Current page: \(Int(pageController.currentPage))")
    }
}


