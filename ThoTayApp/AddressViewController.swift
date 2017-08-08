//
//  AddressViewController.swift
//  ThoTayApp
//
//  Created by Paul on 8/7/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class AddressViewController: UIViewController {
    
    @IBOutlet weak var addressTableView: UITableView!
    var arrayAddress = [AddressBranch]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        self.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_menu"), style: .plain, target: revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "btn_cart"), style: .plain, target: self, action: #selector(AddressViewController.gotoCart))
        self.view.addGestureRecognizer(revealViewController().panGestureRecognizer())
        
        
        let branch1 = AddressBranch(nameBranch: "THỎ TÂY 1:", address: "131 Nguyễn Ánh Thủ, Xã Trung Chánh, H.Hóc Môn, TP.HCM", service: "1900 0235 (24/7)")
        let branch2 = AddressBranch(nameBranch: "THỎ TÂY 2:", address: "255 Võ Văn Ngân, P.Linh Chiểu, Q.Thủ Đức", service: "1900 0235 (24/7)")
        let branch3 = AddressBranch(nameBranch: "THỎ TÂY 3:", address: "495 Quang Trung, P.10, Q.Gò Vấp, TP.HCM ", service: "1900 0235 (24/7)")
        let branch4 = AddressBranch(nameBranch: "THỎ TÂY 4:", address: "504 Hùng Vương, Plieku, Gia La ", service: "1900 0235 (24/7)")
        let branch5 = AddressBranch(nameBranch: "THỎ TÂY 5:", address: "324-326 Lê Duẩn, TP.Đà Nẵng", service: "1900 0235 (24/7)")
        
        arrayAddress.append(branch1)
        arrayAddress.append(branch2)
        arrayAddress.append(branch3)
        arrayAddress.append(branch4)
        arrayAddress.append(branch5)
        
        addressTableView.dataSource = self
        addressTableView.contentInset = UIEdgeInsets(top: -44, left: 0, bottom: 0, right: 0)
    }
    
    func gotoCart () {
        
        let viewCart = storyboard?.instantiateViewController(withIdentifier: "cartID") as! CartViewController
        
        self.navigationController?.modalTransitionStyle = .coverVertical
        self.navigationController?.pushViewController(viewCart, animated: true)
    }
    
}

extension AddressViewController: UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayAddress.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AddressTableViewCell
        
        cell.lblName.text = arrayAddress[indexPath.row].nameBranch
        cell.lblAddress.text = arrayAddress[indexPath.row].address
        cell.lblService.text = arrayAddress[indexPath.row].service
        
        return cell
    }
}






