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
