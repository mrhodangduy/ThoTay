//
//  MenuTableViewController.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/9/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    var menus = [Menu]()
    var expandedSections: NSMutableSet = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menus = [
            Menu(name: "SẢN PHẨM", items: ["Đầm Nữ","Jum & Set","Áo Nữ","Quần & Váy","Áo Khoác","Đồ Ngủ & Đồ Lót","Mũ Phẩm & Trang Sức","Túi Xách & Phụ Kiện"]),
            Menu(name: "GIỎ HÀNG", items: ["Thêm sản phẩm","Xem giỏ hàng"]),
            Menu(name: "HỆ THỐNG CỬA HÀNG", items: ["Chi nhánh", "Liên hệ"])
        ]
        
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }
    
    func sectionTapped(_ sender:UIButton)
    {
        let section = sender.tag
        let shouldExpand = !expandedSections.contains(section)
        if shouldExpand
        {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
        }
        else
        {
            expandedSections.removeAllObjects()
        }
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return menus.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        if expandedSections.contains(section)
        {
            return menus[section].items.count
        } else
        {
            return 0
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        
        cell.selectionStyle = .default
        cell.lblCategotiesMenu.text = menus[indexPath.section].items[indexPath.row]
        cell.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 40))
        let imageView = UIImageView.init(frame: CGRect(x: 15, y: 5, width: headerView.frame.height-10, height: headerView.frame.height-10))
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        if expandedSections.contains(section)
        {
            headerView.backgroundColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
            switch section {
            case 0:
                imageView.image = #imageLiteral(resourceName: "menu_sanpham2").withRenderingMode(.alwaysOriginal)
                
            case 1:
                imageView.image = #imageLiteral(resourceName: "menu_giohang2").withRenderingMode(.alwaysOriginal)
            default:
                imageView.image = #imageLiteral(resourceName: "menu_hethong2").withRenderingMode(.alwaysOriginal)
            }
        }
        else
        {
            
            switch section {
            case 0:
                imageView.image = #imageLiteral(resourceName: "menu_sanpham").withRenderingMode(.alwaysOriginal)
            case 1:
                imageView.image = #imageLiteral(resourceName: "menu_giohang").withRenderingMode(.alwaysOriginal)
            default:
                imageView.image = #imageLiteral(resourceName: "tab_stores").withRenderingMode(.alwaysOriginal)
            }
        }
        
        let headerTitle = UILabel.init(frame: CGRect(x: 60, y: 0, width: headerView.frame.width/2, height: headerView.frame.height))
        headerTitle.text = menus[section].name
        headerTitle.font = headerTitle.font.withSize(13)
        
        let tappedButton = UIButton.init(frame: CGRect(x: 0, y: 0, width: headerView.frame.size.width, height: headerView.frame.size.height))
        tappedButton.addTarget(self, action: #selector(MenuTableViewController.sectionTapped(_:)), for: UIControlEvents.touchUpInside)
        tappedButton.tag = section
        
        headerView.addSubview(imageView)
        headerView.addSubview(headerTitle)
        headerView.addSubview(tappedButton)
        headerView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_topbar"))
        
        return headerView
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: self.tableView.frame.width, height: 20))
        footerView.backgroundColor = UIColor(patternImage: #imageLiteral(resourceName: "bg_topbar"))
        
        return footerView
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath as IndexPath, animated: true)
    }
    
}





