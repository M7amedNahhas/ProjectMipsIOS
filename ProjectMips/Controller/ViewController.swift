//
//  ViewController.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 17/11/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var typeArray = [Instruction]()
    
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
    
    // Add New Method
    @IBAction func AddNewRType(_ sender: UIButton) {
        
        typeArray.append(Instruction(inst:instRtypeNew.text! , Rd: rdRtypeNew.text!, Rs: rsRtypeNew.text!, Rt: rtRtypeNew.text!, Type: "R", Offset: "no"))
        TableView.reloadData()
    }
    
    @IBAction func AddNewIType(_ sender: UIButton) {
        
        typeArray.append(Instruction(inst:instItypeNew.text! , Rd: "no", Rs: rsItypeNew.text!, Rt: rtItypeNew.text!, Type: "I", Offset:offsetItypeNew.text! ))
        TableView.reloadData()
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
            
            
            result = cellOne
        } else {
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "I-TypeCells") as! I_TypeTableViewCell

            
            
            result = cellTwo
        }
        
        return result
        
    }

    
   
    
    @IBOutlet weak var TableView: UITableView!
    
   
    @IBAction func addNewTypeBt(_ sender: UIButton) {
       
        //typeArray.append()
        
       TableView.reloadData()
        
    }
    
    
    
    //picker methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

