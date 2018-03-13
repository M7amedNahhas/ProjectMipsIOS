//
//  ViewController.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 17/11/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UIPickerViewDelegate , UIPickerViewDataSource {
    
    
    
    // R-Type
    
    @IBOutlet weak var instRtypeNew: UITextField!
    
    @IBOutlet weak var rsRtypeNew: UITextField!
    
    @IBOutlet weak var rtRtypeNew: UITextField!
    
    // can be used as an offset also
    
    @IBOutlet weak var rdRtypeNew: UITextField!
    
    var InstructionFromFetch:String?
    
    var InstructionTypeFromFetch:String?
    
    var ClockCycle:Int = 0
    
    var rd:Register?
    
    var rs:Register?
    
    var rt:Register?
    
    var offset:Int?
    
    var memoryAddres:Int?
    
    var RegisterFileIndex:Int?
    
    var typeArray = [Instruction]()
    
    var RegisterFile = [Register]()
    
    var MemoryList = [Int]()
    
    var PipeliningClockCycle:Int = 0
    
    var ForwardingClockCycle:Int = 0
    
    var PreviousInstruction:Instruction?
    
    var PreviousToThePrevious:Instruction?
    
    var DataDependceArray = [DataDependnse]()
    
    var InstructionMemory = ["add":"add","sub":"sub"
        ,"and":"and","or":"or","slt":"slt","nor":"nor","sw":"sw","lw":"lw","srl":"srl","addi":"addi","beq":"beq","bne":"bne","bgt":"bgt" ]
    
    var BranchFlagIsON:Bool = false
    
    // Picker View

    
    var instructionsPickerView = UIPickerView()
    
    var instructionPickerData = ["add","sub","and","or","slt","nor","sw","lw","srl","addi","beq","bne","bgt"]
    
    var iTypeMode:Bool?
    
    var rsPickerView = UIPickerView()
    
    var rtPickerView = UIPickerView()
    
    var rdPickerView = UIPickerView()
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 10 {
            return instructionPickerData[row]
        }
        
        if pickerView.tag == 100  {
          return RegisterFile[row].Name
        }
        
        if pickerView.tag == 1000  {
            return RegisterFile[row].Name
        }
        
        if pickerView.tag == 10000 {
            return RegisterFile[row].Name
        }

        return nil
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 10 {
            return instructionPickerData.count
        }
        
        if pickerView.tag == 100 {
            return RegisterFile.count
        }
        
        if pickerView.tag == 1000 {
            return RegisterFile.count
        }
        
        if pickerView.tag == 10000 {
            return RegisterFile.count
        }
        return 0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 10 {
            instRtypeNew.text = instructionPickerData[row]
            if instructionPickerData[row] == "sw" || instructionPickerData[row] == "lw" || instructionPickerData[row] == "addi" || instructionPickerData[row] == "beq" {
                iTypeMode = true
            } else {
                iTypeMode = false
            }
            CheckITypeMode()
        }
        
        if pickerView.tag == 100 {
            rsRtypeNew.text = RegisterFile[row].Name
        }
        
        if pickerView.tag == 1000 {
            rtRtypeNew.text = RegisterFile[row].Name
        }
        
        if pickerView.tag == 10000 {
            rdRtypeNew.text = RegisterFile[row].Name
        }
    }
    
    // Add New Method
    @IBAction func AddNewInstruction(_ sender: UIButton) {
        
        if iTypeMode == false {
            // R Type
            typeArray.append(Instruction(inst:instRtypeNew.text! , Rd: rdRtypeNew.text!, Rs: rsRtypeNew.text!, Rt: rtRtypeNew.text!, Type: "R", Offset: "0", PipeliningStalls: 0, ForwadingStalls: 0))
        }
        
        if iTypeMode == true {
            // I Type
        
            typeArray.append(Instruction(inst:instRtypeNew.text! , Rd: "no", Rs: rsRtypeNew.text!, Rt: rtRtypeNew.text!, Type: "I", Offset:rdRtypeNew.text!, PipeliningStalls: 0, ForwadingStalls: 0 ))
        }
         TableView.reloadData()
    }

    @IBAction func editTableViewButton(_ sender: UIButton) {
        if TableView.isEditing == true {
            
                    TableView.isEditing = false
        } else {
            
                    TableView.isEditing = true
        }
        
    }
    
    func RegisterFileInit() {
        
        var i:Int = 0
        
        var FirstCount:Int = 0
        
        var SecondCount:Int = 0
        
        var ThirdCount:Int = 0
        
        var FourthCount:Int = 0
        
        while i <= 31 {
            if i == 0 {
                RegisterFile.append(Register(RegName: "zero", RegID: i, RegValue: 0))
            }
            if i == 1 {
                RegisterFile.append(Register(RegName: "at", RegID: i, RegValue: 0))
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
        
        rsPickerView.reloadAllComponents()
        rtPickerView.reloadAllComponents()
        rdPickerView.reloadAllComponents()

    }
    
    func MemoryInit(){
        let memorySize:Int = 100
        var memoryLoopVar:Int = 0
        
        while memoryLoopVar < memorySize {
            MemoryList.append(0)
            memoryLoopVar = memoryLoopVar + 1
        }
    }
    
    func RegisterFileIndexFinder(NameOfTheRegister:String) {
        
        var RegisterFile = ["zero":0 , "at":1 , "v0":2, "v1":3, "a0":4, "a1":5, "a2":6, "a3":7, "t0":8, "t1":9, "t2":10, "t3":11, "t4":12, "t5":13, "t6":14, "t7":15, "s0":16, "s1":17, "s2":18, "s3":19, "s4":20, "s5":21, "s6":22, "s7":23, "t8":24, "t9":25, "k0":26, "k1":27, "gp":28, "sp":29, "fp":30, "ra":31]
        
        RegisterFileIndex = RegisterFile[NameOfTheRegister]
        
        
    }
    
    func Fetch(InstructionFromTextField:String){
        
        
        InstructionFromFetch = InstructionMemory[InstructionFromTextField]
        if InstructionFromFetch == "sw" || InstructionFromFetch == "lw" || InstructionFromFetch == "addi" || InstructionFromFetch == "beq" || InstructionFromFetch == "bne" || InstructionFromFetch == "bgt" {
            InstructionTypeFromFetch = "I"
        } else {
            InstructionTypeFromFetch = "R"
        }
        
        ClockCycle = ClockCycle + 1
    
    }
    
    func Decode(rsFromTextField:String , rdFromTextField:String , rtFromTextField:String , offsetFromTextField:Int,Index:Int){
        
        RegisterFileIndexFinder(NameOfTheRegister: rsFromTextField)
        rs = RegisterFile[RegisterFileIndex!]
        
        if InstructionTypeFromFetch == "R" {
            
            RegisterFileIndexFinder(NameOfTheRegister: rdFromTextField)
            rd = RegisterFile[RegisterFileIndex!]
        }
        
        RegisterFileIndexFinder(NameOfTheRegister: rtFromTextField)
        rt = RegisterFile[RegisterFileIndex!]
        
        if InstructionTypeFromFetch == "I" {
    
            offset = offsetFromTextField
            
        }
        DetectDataDependece(Index: Index)
        ClockCycle = ClockCycle + 1
        
    }
    func DetectDataDependece(Index:Int){
        // PipeLining
        if PreviousInstruction != nil {
            if InstructionTypeFromFetch == "R" && PreviousInstruction?.InstType == "I" {
                if (rs?.ID)! == Int((PreviousInstruction?.Rt)!) || (rt?.ID)! == Int((PreviousInstruction?.Rt)!) {
                    
                    if (rs?.ID)! == Int((PreviousInstruction?.Rt)!) {
                        DataDependceArray.append(DataDependnse(From:(RegisterFile[Int((PreviousInstruction?.Rt)!)!].Name), to: (rs?.Name)!, noOfStall: 2, indexfrom: Index-1, indexTo: Index))
                    }
                    if (rt?.ID)! == Int((PreviousInstruction?.Rt)!) {
                        DataDependceArray.append(DataDependnse(From:(RegisterFile[Int((PreviousInstruction?.Rt)!)!].Name), to: (rt?.Name)!, noOfStall: 2, indexfrom: Index-1, indexTo: Index))
                    }
                    
                    
                    PipeliningClockCycle = PipeliningClockCycle + 2
                    typeArray[Index].setStallsPipelining(stalls: 2)
                    
                    if PreviousInstruction?.Intruction != "addi" {
                        ForwardingClockCycle = ForwardingClockCycle + 1
                        typeArray[Index].setStallsForwarding(stalls: 1)
                    }
                
                }
            }
            if InstructionTypeFromFetch == "R" && PreviousInstruction?.InstType == "R" {
                if (rs?.ID)! == Int((PreviousInstruction?.Rd)!) || (rt?.ID)! == Int((PreviousInstruction?.Rd)!) {
                    
                    if (rs?.ID)! == Int((PreviousInstruction?.Rd)!) {
                        DataDependceArray.append(DataDependnse(From:(PreviousInstruction?.Rd)!, to: (rs?.Name)!, noOfStall: 2, indexfrom: Index-1, indexTo: Index))
                    }
                    if (rt?.ID)! == Int((PreviousInstruction?.Rd)!) {
                        DataDependceArray.append(DataDependnse(From:(PreviousInstruction?.Rd)!, to: (rt?.Name)!, noOfStall: 2, indexfrom: Index-1, indexTo: Index))
                    }
                    PipeliningClockCycle = PipeliningClockCycle + 2
                    typeArray[Index].setStallsPipelining(stalls: 2)
                }
            }
            if InstructionTypeFromFetch == "I" && PreviousInstruction?.InstType == "R" {
                if (rs?.ID)! == Int((PreviousInstruction?.Rd)!) {
                    DataDependceArray.append(DataDependnse(From:(PreviousInstruction?.Rd)!, to: (rs?.Name)!, noOfStall: 2, indexfrom: Index-1, indexTo: Index))
                    PipeliningClockCycle = PipeliningClockCycle + 2
                    typeArray[Index].setStallsPipelining(stalls: 2)
                }
            }
            
            if InstructionTypeFromFetch == "I" && PreviousInstruction?.InstType == "I" {
                    if (rs?.ID)! == Int((PreviousInstruction?.Rt)!) || (rt?.ID)! == Int((PreviousInstruction?.Rt)!) {
                        if (rs?.ID)! == Int((PreviousInstruction?.Rt)!) {
                            
                            DataDependceArray.append(DataDependnse(From:(PreviousInstruction?.Rt)!, to: (rs?.Name)!, noOfStall: 2, indexfrom: Index-1, indexTo: Index))
                            
                        }
                        if (rt?.ID)! == Int((PreviousInstruction?.Rt)!) {
                            
                            DataDependceArray.append(DataDependnse(From:(PreviousInstruction?.Rt)!, to: (rt?.Name)!, noOfStall: 2, indexfrom: Index-1, indexTo: Index))
                            
                        }
                        
                        PipeliningClockCycle = PipeliningClockCycle + 2
                        
                        typeArray[Index].setStallsPipelining(stalls: 2)
                        
                        if PreviousInstruction?.Intruction != "addi" {
                            
                            ForwardingClockCycle = ForwardingClockCycle + 1
                            
                            typeArray[Index].setStallsForwarding(stalls: 1)
                        }
                }
                }
            
            
        }
        // Here we detcet previuous to previous
        if PreviousToThePrevious != nil {
            if InstructionFromFetch == "I" && InstructionTypeFromFetch == "sw" {
                if PreviousToThePrevious?.InstType == "I" {
                    if (rt?.ID)! == Int((PreviousToThePrevious?.Rt)!) {
                        PipeliningClockCycle = PipeliningClockCycle + 2
                        typeArray[Index].setStallsPipelining(stalls: 2)
                    }
                }
            }
            
            
            
            /*if InstructionTypeFromFetch == "R" {
                if PreviousToThePrevious?.InstType == "I" {
                    if (rs?.ID)! == Int((PreviousToThePrevious?.Rt)!) || (rt?.ID)! == Int((PreviousToThePrevious?.Rt)!) {
                        PipeliningClockCycle = PipeliningClockCycle + 1
                    }
                }
            } */
            /*
            if (rs?.ID)! == Int((PreviousToThePrevious?.Rt)!) || (rt?.ID)! == Int((PreviousToThePrevious?.Rt)!) {
                PipeliningClockCycle = PipeliningClockCycle + 1
            }
            
            if (rs?.ID)! == Int((PreviousToThePrevious?.Rd)!) || (rt?.ID)! == Int((PreviousToThePrevious?.Rd)!) {
                PipeliningClockCycle = PipeliningClockCycle + 1
            }*/
        }
        
        // Forwarding
        
        
    }
    func Execution(){
        BranchFlagIsON = false
        if InstructionTypeFromFetch == "R" {
            var ExecutionList:[String:Int] = ["add":(rs?.Value)! + (rt?.Value)!,
                                              "sub":(rs?.Value)! - (rt?.Value)!,
                                              "or":(rs?.Value)! | (rt?.Value)!,
                                              "and":(rs?.Value)! & (rt?.Value)!,
                                              "nor":~((rs?.Value)! | (rt?.Value)!)]
            
            rd?.setValue(newValue: ExecutionList[InstructionFromFetch!]!)
        }
        
        if InstructionFromFetch == "sw" || InstructionFromFetch == "lw"{
            
            memoryAddres = (rs?.Value)! + (offset)!
        }
        
        if InstructionFromFetch == "addi" {

            rt?.setValue(newValue: (offset)! + (rs?.Value)!)
            
        }
        if InstructionFromFetch == "beq"{
            if rs?.Value == rt?.Value {
                BranchFlagIsON = true
            } else {
                BranchFlagIsON = false
            }
            
            
        }
        if InstructionFromFetch == "bne"{
            if rs?.Value != rt?.Value {
                BranchFlagIsON = true
            } else {
                BranchFlagIsON = false
            }
        }
        if InstructionFromFetch == "bgt"{
            if rs!.Value > rt!.Value {
                BranchFlagIsON = true
            }else {
                BranchFlagIsON = false
            }
        }
       
        
    
        
       ClockCycle = ClockCycle + 1
    }
    
    func Memory() {
        
        if InstructionFromFetch == "sw" {
            
            MemoryList.insert((rt?.Value)!, at: memoryAddres!)
            
            
        }
        
        if InstructionFromFetch == "lw" {
            
            rt?.setValue(newValue: MemoryList[memoryAddres!])
            
        }
        
        ClockCycle = ClockCycle + 1
    }
    
    func WrightBack() {
        
        if InstructionTypeFromFetch == "R" {
            RegisterFile[RegisterFileIndex!].setValue(newValue: (rd?.Value)!)
        }
        if InstructionFromFetch == "lw" {
            RegisterFile[(rt?.ID)!].setValue(newValue: ((rs?.Value)! + offset!))
        }
        if InstructionFromFetch == "addi" {
            RegisterFile[(rt?.ID)!].setValue(newValue: (rt?.Value)!)
        }

        print("After Right Back!")
        var z:Int = 0
        while z <= 31 {
            print("\(RegisterFile[z].Name) \(RegisterFile[z].Value)")
            z = z+1
        }
        ClockCycle = ClockCycle + 1
        if PreviousInstruction != nil {
           PreviousToThePrevious = PreviousInstruction
        }
        PreviousInstruction = Instruction(inst: InstructionFromFetch!, Rd: ("\(rd?.ID ?? 0)"), Rs: ("\(rs?.ID ?? 0)"), Rt: ("\(rt?.ID ?? 0)"), Type: InstructionTypeFromFetch!, Offset: ("\(offset ?? 0)"), PipeliningStalls: 0, ForwadingStalls: 0)
        
    }
    
    
    // TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArray.count
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let selecedtItem = typeArray[sourceIndexPath.row]
        typeArray.remove(at: sourceIndexPath.row)
        typeArray.insert(selecedtItem, at: destinationIndexPath.row)
        TableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            typeArray.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let result: UITableViewCell
        
        if (typeArray[indexPath.row].InstType == "R") {
            let cellOne = tableView.dequeueReusableCell(withIdentifier: "R-TypeCells") as! R_TypeTableViewCell

            cellOne.RTypeOpCodeTextField.text = typeArray[indexPath.row].Intruction
            cellOne.RTypeRtTextField.text = typeArray[indexPath.row].Rt
            cellOne.RTypeRsTextField.text = typeArray[indexPath.row].Rs
            cellOne.RTypeRdTextField.text = typeArray[indexPath.row].Rd
            cellOne.IndexOfInstruction.text = "\(indexPath.row)"
            
            cellOne.textLabel?.numberOfLines = 3
        
            
            result = cellOne
        } else {
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "I-TypeCells") as! I_TypeTableViewCell
            
            cellTwo.ITypeOpCodeTextField.text = typeArray[indexPath.row].Intruction
            cellTwo.ITypeRsTextField.text = typeArray[indexPath.row].Rs
            cellTwo.ITypeRtTextField.text = typeArray[indexPath.row].Rt
            cellTwo.ITypeOffsetTextField.text = typeArray[indexPath.row].Offset
            cellTwo.InstructionIndexTextField.text = "\(indexPath.row)"
            cellTwo.textLabel?.numberOfLines = 3

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
        
        
        instructionsPickerView.delegate = self
        instructionsPickerView.dataSource = self
        instructionsPickerView.tag = 10
        instRtypeNew.inputView = instructionsPickerView
        
        rsPickerView.delegate = self
        rsPickerView.dataSource = self
        rsPickerView.tag = 100
        rsRtypeNew.inputView = rsPickerView
        
        rtPickerView.delegate = self
        rtPickerView.dataSource = self
        rtPickerView.tag = 1000
        rtRtypeNew.inputView = rtPickerView
        
        rdPickerView.delegate = self
        rdPickerView.dataSource = self
        rdPickerView.tag = 10000
        rdRtypeNew.inputView = rdPickerView
        
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: self.view.frame.size.height/6, width: self.view.frame.size.width, height: 40.0))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.done, target: self, action: #selector(ViewController.donePressed))
        
        toolBar.setItems([doneButton], animated: true)
        
        instRtypeNew.inputAccessoryView = toolBar
        rtRtypeNew.inputAccessoryView = toolBar
        rsRtypeNew.inputAccessoryView = toolBar
        rdRtypeNew.inputAccessoryView = toolBar
        
        TableView.estimatedRowHeight = 140
        TableView.rowHeight = UITableViewAutomaticDimension
        
        RegisterFileInit()
        MemoryInit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func donePressed(_ sender: UIBarButtonItem) {
       // jobTypeTextField.text = SelectedPickerType?.name
     //   jobGenderTextField.text = selectedGender
        
        CheckITypeMode()
        
       // rtRtypeNew.text =
        
        
        instRtypeNew.resignFirstResponder()
        rtRtypeNew.resignFirstResponder()
        rsRtypeNew.resignFirstResponder()
        rdRtypeNew.resignFirstResponder()

        
    }
    
    @IBAction func ExcuteButtonDo(_ sender: UIButton) {
        if typeArray.isEmpty == false {
            var j:Int = 0
            var indexOfArrayForLabel:Int = 0
            while j < typeArray.count {
                Fetch(InstructionFromTextField: typeArray[j].Intruction)
                Decode(rsFromTextField: typeArray[j].Rs, rdFromTextField: typeArray[j].Rd, rtFromTextField: typeArray[j].Rt, offsetFromTextField: Int(typeArray[j].Offset) ?? 0, Index: j)
                Execution()
                Memory()
                WrightBack()
                print("Pipe \(typeArray[j].PipeliningStallsNumber) Forwarding \(typeArray[j].ForwardingStallsNumber)")
                if BranchFlagIsON == true {
                    j = offset!
                } else {
                   j = j + 1
                }
                indexOfArrayForLabel =  indexOfArrayForLabel + 1
                
            }
            print("ClockCycle \(ClockCycle)")
            Pipelining()
            FullForwarding()
            print("loop count \(indexOfArrayForLabel)")
            performSegue(withIdentifier: "ShowSecond", sender: nil)
            clearAll()
        } else {
            createAlertWithOnlyOkAction(title: " ", measge: Texts.NO_INSTRUCTIONS_ADDED)
        }

    }
    
    func Pipelining() {

        PipeliningClockCycle = 5 + (typeArray.count - 1) + PipeliningClockCycle
        print("Pipelining ClockCycle  \(PipeliningClockCycle)")

    }
    
    func FullForwarding() {
        
       // ForwardingClockCycle =
        ForwardingClockCycle = 5 + (typeArray.count - 1) + ForwardingClockCycle
        print("Forwarding ClockCycle  \(ForwardingClockCycle)")
        
    }
    
    func clearAll(){
        ClockCycle = 0
        PipeliningClockCycle = 0
        ForwardingClockCycle = 0
        RegisterFile.removeAll()
        RegisterFileInit()
        MemoryList.removeAll()
        MemoryInit()
        PreviousInstruction = nil
        PreviousToThePrevious = nil
        DataDependceArray.removeAll()
        BranchFlagIsON = false
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowSecond" {
            let nav = segue.destination as! SecondViewController
            nav.TableViewArray = DataDependceArray
            nav.NormalCC = ClockCycle
            nav.PipeliningCC = PipeliningClockCycle
            nav.ForwardingCC = ForwardingClockCycle
        }
    }
    

    @IBAction func DoClearActionButton(_ sender: UIButton) {
        
        typeArray.removeAll()
        clearAll()
        TableView.reloadData()
        
    }
    
    func CheckITypeMode(){
        if iTypeMode == true {
            rdRtypeNew.inputView = nil
            rdRtypeNew.placeholder = "offset"
            rdRtypeNew.keyboardType = .numberPad
            // rdRtypeNew.text = nil
            rdRtypeNew.reloadInputViews()
            
            
        }
        if iTypeMode == false {
            rdRtypeNew.inputView = rdPickerView
            rdRtypeNew.placeholder = "rd"
            
        }
    }
    
    func createAlertWithOnlyOkAction(title :String , measge :String) {
        let alert = UIAlertController(title: title, message: measge, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

