//
//  DataTableViewCell.swift
//  QuizDataKaryawan
//
//  Created by Gw on 27/10/17.
//  Copyright © 2017 Gw. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var labelgolongan: UILabel!
    @IBOutlet weak var labelstaff: UILabel!
    @IBOutlet weak var labeluser: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
