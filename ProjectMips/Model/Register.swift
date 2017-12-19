//
//  Register.swift
//  ProjectMips
//
//  Created by Amin Fadul on 12/19/17.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import Foundation

class Register {
    
    private var _name:String
    
    private var _ID:Int
    
    private var _Value:Int
    
    var Name:String {
        return _name
    }
    
    var ID:Int {
        return _ID
    }
    
    var Value:Int {
        return _Value
    }
    
    init(RegName:String , RegID:Int , RegValue:Int){
        
        _name = RegName
        _ID = RegID
        _Value = RegValue
    
    }
    
    func setValue(newValue:Int) {
        
        _Value = newValue
        
    }

}
