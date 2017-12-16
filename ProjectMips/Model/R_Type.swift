//
//  R_Type.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 16/12/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import Foundation

class R_Type{
    private var _OpCode : String
    private var _Rd : String
    private var _Rs: String
    private var _Rt : String
    
    
    init(OpCode : String, Rd : String, Rs : String,Rt : String ){
        self._OpCode = OpCode
        self._Rd = Rd
        self._Rs = Rs
        self._Rt = Rt
        
    }
    
    var OpCode : String {
        
        return _OpCode
    }
    
    var Rd : String {
        
        return _Rd
    }
    var Rs : String {
        
        return _Rs
    }
    
    var Rt : String {
        
        return _Rt
    }
    
    
    
    
}
