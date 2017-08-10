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
    let arrColor:[UIColor] = [#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1),#colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1),#colorLiteral(red: 0.9951873422, green: 0.1576325595, blue: 0.3148853183, alpha: 1),#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1),#colorLiteral(red: 0.5791940689, green: 0.1280144453, blue: 0.5726861358, alpha: 1)]
    let arrColorText:[String] = ["LightGreen","Organe","Red","Blue","Purple"]
    
    var selectIndexSize = 1
    var selectIndexColor:Int = 0
    
    var arrayProductImage = [UIImage]()
    var image = UIImage()
    var productname = ""
    var discountPrice = ""
    var orginalPrice = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectIndexColor = Int(arc4random_uniform(UInt32(arrColor.count)))
        
        
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
        arrayProductImage.append(#imageLiteral(resourceName: "ic_product"))
        arrayProductImage.insert(image, at: 0)
        
        
        pageController.hidesForSinglePage = true
        pageController.numberOfPages = arrayProductImage.count
        pageController.currentPageIndicatorTintColor = #colorLiteral(red: 0.9445296526, green: 0.2091335058, blue: 0.5810018182, alpha: 1)
        pageController.pageIndicatorTintColor = UIColor.white
        pageController.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        
        
        
        
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
        let color = arrColorText[Int(selectIndexColor)]
        
        let item = ProdcutInCart(image: newImage, nameItem: name, discountPrice: discount, orginalPrice: original, size: size, color: color)
        
        arrayProductInCart.insert(item, at: 0)
        
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
            
            
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = CGFloat(20)
            layout.minimumLineSpacing = CGFloat(10)
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0)
            
            
            cell.lblSize.text = arraySize[indexPath.row]
            cell.lblSize.layer.cornerRadius = cell.lblSize.frame.size.height / 2
            cell.lblSize.clipsToBounds = true
            cell.lblSize.layer.borderWidth = 0.5
            cell.lblSize.layer.borderColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1).cgColor
            
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
            let layout = UICollectionViewFlowLayout()
            layout.minimumInteritemSpacing = CGFloat(20)
            layout.minimumLineSpacing = CGFloat(20)
            layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0)
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellcolor", for: indexPath) as! ColorCollectionViewCell
            
            cell.imageColor.layer.cornerRadius = cell.imageColor.frame.size.height / 2
            cell.imageColor.clipsToBounds = true
            cell.imageColor.backgroundColor = arrColor[indexPath.row]
            
            cell.imageRound.backgroundColor = UIColor.clear
            cell.imageRound.borderColor = arrColor[selectIndexColor]
            cell.imageRound.alpha = 0
            
            if selectIndexColor == indexPath.row
            {
                cell.imageColor.image = #imageLiteral(resourceName: "ticked")
                cell.imageRound.alpha = 1

            }
            else
            {
                cell.imageColor.image = UIImage()
                cell.imageRound.alpha = 0
                
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
            
            collectionView.deselectItem(at: indexPath, animated: true)
            selectIndexColor = indexPath.row
            print(arrColorText[Int(selectIndexColor)])
            self.colorCollectionView.reloadData()
            
        }
        
    }
    
}


extension DetailProductViewController: UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.colorCollectionView
        {
            let width = (self.view.frame.size.width - CGFloat((arrColor.count + 1) * 20)) / CGFloat(5) //some width
            let height:CGFloat = width
            return CGSize(width: width, height: height)
        }
        else if collectionView == self.sizeCollectionView
        {
            let width = (self.view.frame.size.width - CGFloat((arrColor.count + 1) * 20)) / CGFloat(5) //some width
            let height:CGFloat = 30
            return CGSize(width: width, height: height);
        }
        else
        {
            let height = self.prouctImageCollectionView.frame.size.height
            let width =  self.prouctImageCollectionView.frame.size.width
            return CGSize(width: width, height: height);
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


