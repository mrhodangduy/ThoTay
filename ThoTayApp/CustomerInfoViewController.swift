//
//  CustomerInfoViewController.swift
//  ThoTayApp
//
//  Created by QTS Coder on 8/9/17.
//  Copyright © 2017 Paul. All rights reserved.
//

import UIKit

class CustomerInfoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.titleView = UIImageView(image: #imageLiteral(resourceName: "ic_logo"))
        
    }

   
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 9
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultCell = UITableViewCell()
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell5", for: indexPath)
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell6", for: indexPath)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell7", for: indexPath)
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell8", for: indexPath)
            return cell
        case 8:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell9", for: indexPath)
            return cell
        default:
            return defaultCell
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0: return 44
        case 1: return 44
        case 2: return 44
        case 3: return 10
        case 4: return 44
        case 5: return 44
        case 6: return 44
        case 7: return 60
        case 8: return 70
        default: return 0
        }
    }
 
}

extension CustomerInfoViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Determine the row number of the active UITextField in which "return" was just pressed.
        
        let cellContainingFirstResponder: Any? = textField.superview?.superview
        let rowOfCellContainingFirstResponder: Int = tableView.indexPath(for: cellContainingFirstResponder as! UITableViewCell)!.row
        
        // Get a reference to the next cell.
        let indexPathOfNextCell = IndexPath(row: rowOfCellContainingFirstResponder + 1, section: 0)
        let nextCell: UITableViewCell? = (tableView.cellForRow(at: indexPathOfNextCell))
        if nextCell != nil {
            textField.becomeFirstResponder()
        }
        else {
            textField.resignFirstResponder()
        }
        return true
    }
    
}











