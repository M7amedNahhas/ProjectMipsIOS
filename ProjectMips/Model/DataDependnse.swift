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
    
    //var RegisterFile = ["zero":0 , "at":1 , "v0":2, "v1":3, "a0":4, "a1":5, "a2":6, "a3":7, "t0":8, "t1":9, "t2":10, "t3":11, "t4":12, "t5":13, "t6":14, "t7":15, "s0":16, "s1":17, "s2":18, "s3":19, "s4":20, "s5":21, "s6":22, "s7":23, "t8":24, "t9":25, "k0":26, "k1":27, "gp":28, "sp":29, "fp":30, "ra":31]
    
    
    init(From:String , to:String , noOfStall:Int , indexfrom:Int , indexTo:Int) {
        _RegisterFrom = From
        _RegisterTo = to
        _NoOfStalls = noOfStall
        _IndexFrom = indexfrom
        _IndexTo = indexTo
    }
    
    var RegisterFrom:String {
        return _RegisterFrom
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
