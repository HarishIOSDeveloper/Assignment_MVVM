//
//  ListViewModel.swift
//  Technology_Assesment
//
//  Created by Haritej on 11/12/20.
//  Copyright © 2020 com.ipac.iOS. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD

class ListViewModel : NSObject {
    internal var getListArray: ListResponseMaster?
    private var tableView: UITableView?
    var tableVieww : UITableView? {
        get {
            return tableView
        } set (newValue) {
            self.tableView = newValue
        }
    }
}

extension ListViewModel : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.getListArray?.results?.count ?? 0 > 0  {
            return  self.getListArray?.results?.count ?? 0
        } else {
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.getListCellData(tableView,cellForRowAt: indexPath)
    }
    private func getListCellData(_ tableView: UITableView, cellForRowAt indexPath: IndexPath ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListVCCell", for: indexPath) as? ListVCCell else {
            return UITableViewCell()
        }
        cell.indexx = indexPath
        cell.getListModel = self.getListArray
        return cell
    }
}
extension ListViewModel {
    internal func getDatafromServerAPI() -> Void {
        SVProgressHUD.show()
        APIManager.getList(completion: { [weak self] (response,data,statusMsg,status,statusCode) in
            SVProgressHUD.dismiss()
            switch(response) {
            case .success(let sucess):
                self?.getListArray = sucess
                self?.tableView?.isHidden = false
                self?.tableView?.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        })
    }
}
