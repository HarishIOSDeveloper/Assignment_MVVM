//
//  ListVC.swift
//  Technology_Assesment
//
//  Created by Haritej on 11/12/20.
//  Copyright © 2020 com.ipac.iOS. All rights reserved.
//

import UIKit
import SVProgressHUD

class ListVC: UIViewController {

    lazy var listViewModel : ListViewModel? = {
         return ListViewModel()
     }()
    
    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.dataSource = listViewModel
        }
    }

    private var getListData: ListResponseMaster?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.isHidden = true
        self.listViewModel?.tableVieww = self.tableView
        self.listViewModel?.getDatafromServerAPI()

    }
}
