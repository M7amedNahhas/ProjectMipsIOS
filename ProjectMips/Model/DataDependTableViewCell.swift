//
//  DataDependTableViewCell.swift
//  ProjectMips
//
//  Created by Amin Fadul on 12/25/17.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class DataDependTableViewCell: UITableViewCell {

    @IBOutlet weak var indexfromCell: CustomLabel!
    @IBOutlet weak var indextoCell: CustomLabel!
    
    @IBOutlet weak var regfromCell: CustomLabel!
    
    @IBOutlet weak var regtoCell: CustomLabel!
    
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
