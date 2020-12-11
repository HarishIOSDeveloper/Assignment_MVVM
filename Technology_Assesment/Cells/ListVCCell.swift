//
//  ListVCCell.swift
//  Technology_Assesment
//
//  Created by Haritej on 11/12/20.
//  Copyright © 2020 com.ipac.iOS. All rights reserved.
//

import UIKit

class ListVCCell: UITableViewCell {
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var abstrct: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var extraLabel: UILabel!
    internal var indexx: IndexPath?
    internal var getListModel: ListResponseMaster? {
        didSet {
            if let titles = getListModel?.results?[indexx?.row ?? 0].title {
                self.title.text = titles
            }
            if let abstracts = getListModel?.results?[indexx?.row ?? 0].abstract {
                self.abstrct.text = abstracts
            }
            if let dates = getListModel?.results?[indexx?.row ?? 0].published_date {
                self.abstrct.text = dates
            }
        }
    }
    
}
