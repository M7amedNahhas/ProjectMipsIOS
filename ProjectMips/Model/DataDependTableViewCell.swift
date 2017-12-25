//
//  DataDependTableViewCell.swift
//  ProjectMips
//
//  Created by Amin Fadul on 12/25/17.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class DataDependTableViewCell: UITableViewCell {

    @IBOutlet weak var indexfromCell: UILabel!
    @IBOutlet weak var indextoCell: UILabel!
    
    @IBOutlet weak var regfromCell: UILabel!
    
    @IBOutlet weak var regtoCell: UILabel!
    
    @IBOutlet weak var noStallCell: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
