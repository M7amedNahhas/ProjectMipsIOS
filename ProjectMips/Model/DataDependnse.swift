//
//  DataDependnse.swift
//  ProjectMips
//
//  Created by Amin Fadul on 12/25/17.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import Foundation

class DataDependnse {
    
    private var _RegisterFrom:String
    private var _RegisterTo:String
    private var _NoOfStalls:Int
    private var _IndexFrom:Int
    private var _IndexTo:Int
    
    var RegisterFile = [0:"zero", 1:"at" , 2:"v0", 3:"v1", 4:"a0", 5:"a1", 6:"a2", 7:"a3", 8:"t0", 9:"t1", 10:"t2", 11:"t3", 12:"t4", 13:"t5", 14:"t6", 15:"t7", 16:"s0", 17:"s1", 18:"s2", 19:"s3", 20:"s4", 21:"s5", 22:"s6", 23:"s7", 24:"t8", 25:"t9", 26:"k0", 27:"k1", 28:"gp", 29:"sp", 30:"fp", 31:"ra"]
    
    
    init(From:String , to:String , noOfStall:Int , indexfrom:Int , indexTo:Int) {
        _RegisterFrom = From
        _RegisterTo = to
        _NoOfStalls = noOfStall
        _IndexFrom = indexfrom
        _IndexTo = indexTo
    }
    
    var RegisterFrom:String {
        return RegisterFile[Int(_RegisterFrom)!]!
    }
    
    var RegisterTo:String {
        return _RegisterTo
    }
    
    var NumberOfStalls:Int {
        return _NoOfStalls
    }
    
    var IndexFrom:Int {
        return _IndexFrom
    }
    
    var IndexTo:Int {
        return _IndexTo
    }
}
