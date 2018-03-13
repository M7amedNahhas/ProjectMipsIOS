//
//  R_Type.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 16/12/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import Foundation

class Instruction{
    
    private var _Intruction:String
    
    private var _Rd:String
    
    private var _Rs:String
    
    private var _Rt:String
    
    private var _Type:String
    
    private var _Offset:String
    
    private var _PipeliningStallsNumber:Int
    
    private var _ForwardingStallsNumber:Int
    
    
    
    init(inst : String, Rd : String, Rs : String,Rt : String ,Type:String, Offset:String, PipeliningStalls:Int , ForwadingStalls:Int){
        self._Intruction = inst
        self._Rd = Rd
        self._Rs = Rs
        self._Rt = Rt
        self._Type = Type
        self._Offset = Offset
        self._PipeliningStallsNumber = PipeliningStalls
        self._ForwardingStallsNumber = ForwadingStalls
        
    }
    
    var Intruction:String {
        
        return _Intruction
    }
    
    var Rd:String {
        
        return _Rd
    }
    var Rs:String {
        
        return _Rs
    }
    
    var Rt:String {
        
        return _Rt
    }
    
    var InstType:String {
        return _Type
    }
    
    var Offset:String {
        return _Offset
    }
    
    var PipeliningStallsNumber:Int {
        return _PipeliningStallsNumber
    }
    
    var ForwardingStallsNumber:Int {
        return _ForwardingStallsNumber
    }
    
    func setStallsPipelining(stalls:Int){
        _PipeliningStallsNumber = stalls
    }
    
    func setStallsForwarding(stalls:Int){
        _ForwardingStallsNumber = stalls
    }
    
}
