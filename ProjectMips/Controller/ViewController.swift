//
//  ViewController.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 17/11/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    
    
    // R-Type
    
    @IBOutlet weak var instRtypeNew: UITextField!
    
    @IBOutlet weak var rsRtypeNew: UITextField!
    
    @IBOutlet weak var rtRtypeNew: UITextField!
    
    @IBOutlet weak var rdRtypeNew: UITextField!
    
    // I-Type
    
    @IBOutlet weak var instItypeNew: UITextField!
    
    @IBOutlet weak var rtItypeNew: UITextField!
    
    @IBOutlet weak var rsItypeNew: UITextField!
    
    @IBOutlet weak var offsetItypeNew: UITextField!
    
    //
    
    var InstructionFromFetch:String?
    var InstructionTypeFromFetch:String?
    var ClockCycle:Int = 0
    
    var rd:Register?
    var rs:Register?
    var rt:Register?
    
    var RegisterFileIndex:Int?
    
    var typeArray = [Instruction]()
    
   
    
    var RegisterFile = [Register]()
    
    
    
    // Add New Method
    @IBAction func AddNewRType(_ sender: UIButton) {
        
        typeArray.append(Instruction(inst:instRtypeNew.text! , Rd: rdRtypeNew.text!, Rs: rsRtypeNew.text!, Rt: rtRtypeNew.text!, Type: "R", Offset: "no"))
         TableView.reloadData()
        
    }
    
    @IBAction func AddNewIType(_ sender: UIButton) {
        
        typeArray.append(Instruction(inst:instItypeNew.text! , Rd: "no", Rs: rsItypeNew.text!, Rt: rtItypeNew.text!, Type: "I", Offset:offsetItypeNew.text! ))
        TableView.reloadData()
        
    }
    
    func RegisterFileInit() {
        var i:Int = 0
        var FirstCount:Int = 0
        var SecondCount:Int = 0
        var ThirdCount:Int = 0
        var FourthCount:Int = 0
        
        while i <= 31 {
            if i == 0 {
                RegisterFile.append(Register(RegName: "zero", RegID: i, RegValue: 10))
            }
            if i == 1 {
                RegisterFile.append(Register(RegName: "at", RegID: i, RegValue: 5))
            }
            if i >= 2 && i <= 3 {
                RegisterFile.append(Register(RegName: "v\(FirstCount)", RegID: i, RegValue: 0))
               FirstCount = FirstCount + 1
            }
            if (i >= 4 && i <= 7) {
               RegisterFile.append(Register(RegName: "a\(SecondCount)", RegID: i, RegValue: 0))
               SecondCount = SecondCount + 1
            }
            if (i >= 8 && i <= 15) {
              RegisterFile.append(Register(RegName: "t\(ThirdCount)", RegID: i, RegValue: 0))
               ThirdCount = ThirdCount + 1
            }
            if (i >= 16 && i <= 23) {
                RegisterFile.append(Register(RegName: "s\(FourthCount)", RegID: i, RegValue: 0))
                FourthCount = FourthCount + 1
            }
            if (i == 24) {
              RegisterFile.append(Register(RegName: "t8", RegID: i, RegValue: 0))
            }
            if (i == 25) {
                RegisterFile.append(Register(RegName: "t9", RegID: i, RegValue: 0))
            }
            if (i == 26) {
                RegisterFile.append(Register(RegName: "k0", RegID: i, RegValue: 0))
            }
            if (i == 27) {
                RegisterFile.append(Register(RegName: "k1", RegID: i, RegValue: 0))
            }
            if (i == 28) {
                RegisterFile.append(Register(RegName: "gp", RegID: i, RegValue: 0))
            }
            if (i == 29) {
                RegisterFile.append(Register(RegName: "sp", RegID: i, RegValue: 0))
            }
            if (i == 30) {
                RegisterFile.append(Register(RegName: "fp", RegID: i, RegValue: 0))
            }
            if (i == 31) {
                RegisterFile.append(Register(RegName: "ra", RegID: i, RegValue: 0))
            }
            i = i + 1
        }
    }
    
    func RegisterFileIndexFinder(NameOfTheRegister:String) {
        
        var RegisterFile = ["zero":0 , "at":1 , "v0":2, "v1":3, "a0":4, "a1":5, "a2":6, "a3":7, "t0":8, "t1":9, "t2":10, "t3":11, "t4":12, "t5":13, "t6":14, "t7":15, "s0":16, "s1":17, "s2":18, "s3":19, "s4":20, "s5":21, "s6":22, "s7":23, "t8":24, "t9":25, "k0":26, "k1":27, "gp":28, "sp":29, "fp":30, "ra":31]
        
        RegisterFileIndex = RegisterFile[NameOfTheRegister]
    }
    
    func Fetch(InstructionFromTextField:String){
        
        var InstructionMemory = ["add":"add","sub":"sub"
            ,"and":"and","or":"or","slt":"slt","nor":"nor","sw":"sw","lw":"lw","srl":"srl","addi":"addi"]
       InstructionFromFetch = InstructionMemory[InstructionFromTextField]
        if InstructionFromFetch == "sw" || InstructionFromFetch == "lw" || InstructionFromFetch == "addi" {
            InstructionTypeFromFetch = "I"
        } else {
            InstructionTypeFromFetch = "R"
        }
        
        ClockCycle = ClockCycle + 1
    
    }
    
    func Decode(rsFromTextField:String , rdFromTextField:String , rtFromTextField:String){
        
        RegisterFileIndexFinder(NameOfTheRegister: rsFromTextField)
        rs = RegisterFile[RegisterFileIndex!]
        
        RegisterFileIndexFinder(NameOfTheRegister: rdFromTextField)
        rd = RegisterFile[RegisterFileIndex!]
        
        RegisterFileIndexFinder(NameOfTheRegister: rtFromTextField)
        rt = RegisterFile[RegisterFileIndex!]
        
        ClockCycle = ClockCycle + 1
        
    }
    
    func Execution(){
        if InstructionTypeFromFetch == "R" {
            var ExecutionList:[String:Int] = ["add":(rs?.Value)! + (rt?.Value)!,"sub":(rs?.Value)! - (rt?.Value)!]
            
            rd?.setValue(newValue: ExecutionList[InstructionFromFetch!]!)
        } else {
            
        }
        
       print(rd?.Value)
       ClockCycle = ClockCycle + 1
    }
    
    
    
    // TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArray.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let result: UITableViewCell
        
        if (typeArray[indexPath.row].InstType == "R") {
            let cellOne = tableView.dequeueReusableCell(withIdentifier: "R-TypeCells") as! R_TypeTableViewCell

            cellOne.RTypeOpCodeTextField.text = typeArray[indexPath.row].Intruction
            cellOne.RTypeRtTextField.text = typeArray[indexPath.row].Rt
            cellOne.RTypeRsTextField.text = typeArray[indexPath.row].Rs
            cellOne.RTypeRdTextField.text = typeArray[indexPath.row].Rd
        
            
            result = cellOne
        } else {
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "I-TypeCells") as! I_TypeTableViewCell

            result = cellTwo
        }
        
        return result
        
    }

    @IBOutlet weak var TableView: UITableView!
    
    //picker methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.reloadData()
        
        RegisterFileInit()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ExcuteButtonDo(_ sender: UIButton) {
        var j:Int = 0
        while j < typeArray.count {
            Fetch(InstructionFromTextField: typeArray[j].Intruction)
            Decode(rsFromTextField: typeArray[j].Rs, rdFromTextField: typeArray[j].Rd, rtFromTextField: typeArray[j].Rt)
            Execution()
            
            j = j + 1
        }
        
    }
    


}

