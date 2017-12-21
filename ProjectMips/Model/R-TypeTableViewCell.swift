//
//  R-TypeTableViewCell.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 15/12/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class R_TypeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var RTypeOpCodeTextField: UITextField!
    
    @IBOutlet weak var RTypeRdTextField: UITextField!
    
    @IBOutlet weak var RTypeRsTextField: UITextField!
    
    @IBOutlet weak var RTypeRtTextField: UITextField!
    
    @IBOutlet weak var IndexOfInstruction: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
