//
//  HomeTableViewCell.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/8/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var pageController: UIPageControl!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
extension HomeTableViewCell: UIScrollViewDelegate
{
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth: CGFloat  = bannerCollection.frame.size.width
        let currentpage: Float = Float(bannerCollection.contentOffset.x / pageWidth)
        
        if 0.0 != fmodf(currentpage, 1.0)
        {
            pageController.currentPage = Int(currentpage + 1.0)
        }
        else
        {
            pageController.currentPage = Int(currentpage)
        }
        print("Current page: \(Int(pageController.currentPage))")
    }
    
}



