//
//  I-TypeTableViewCell.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 15/12/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class I_TypeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var ITypeOpCodeTextField: UITextField!
    
    
    @IBOutlet weak var ITypeRtTextField: UITextField!
    
    @IBOutlet weak var ITypeRsTextField: UITextField!
    
    @IBOutlet weak var ITypeOffsetTextField: UITextField!
    @IBOutlet weak var InstructionIndexTextField: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
