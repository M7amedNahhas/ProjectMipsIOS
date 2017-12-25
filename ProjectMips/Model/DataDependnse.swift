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
