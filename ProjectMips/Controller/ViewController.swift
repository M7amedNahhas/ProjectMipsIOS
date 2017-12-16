//
//  ViewController.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 17/11/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
     var typeArray = [String]()
    
    
    
    
    
    
    
    // TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return typeArray.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let result: UITableViewCell
        
        if (TypesSegmented.selectedSegmentIndex == 0) {
            let cellOne = tableView.dequeueReusableCell(withIdentifier: "R-TypeCells") as! R_TypeTableViewCell
            cellOne.RTypeOpCodeTextField.text = typeArray[indexPath.row]
            cellOne.RTypeRdTextField.text = typeArray[indexPath.row]
            cellOne.RTypeRsTextField.text = typeArray[indexPath.row]
            cellOne.RTypeRtTextField.text = typeArray[indexPath.row]
            //Configure here
            result = cellOne
        } else {
            let cellTwo = tableView.dequeueReusableCell(withIdentifier: "I-TypeCells") as! I_TypeTableViewCell
            cellTwo.ITypeOpCodeTextField.text = typeArray[indexPath.row]
            cellTwo.ITypeRsTextField.text = typeArray[indexPath.row]
            cellTwo.ITypeRtTextField.text = typeArray[indexPath.row]
            //Configure here
            result = cellTwo
        }
        
        return result
        
        
//
//        if ((typeArray[indexPath.row] as? String) != nil) {
//            let cell = tableView.dequeueReusableCell(withIdentifier: "R-TypeCells") as! R_TypeTableViewCell
//
//            cell.RTypeOpCodeTextField.text = typeArray[indexPath.row]
//            cell.RTypeRdTextField.text = typeArray[indexPath.row]
//            cell.RTypeRsTextField.text = typeArray[indexPath.row]
//            cell.RTypeRtTextField.text = typeArray[indexPath.row]
//
//
//            return cell
//        }
//
//        if ((typeArray[indexPath.row] as? String) != nil) {
//
//            let cell2 = tableView.dequeueReusableCell(withIdentifier: "I-TypeCells") as! I_TypeTableViewCell
//            cell2.ITypeRsTextField.text = typeArray[indexPath.row]
//
//
//            return cell2
//        }
        
        
    }

    
   
    
    @IBOutlet weak var TableView: UITableView!
    
   
    @IBAction func addNewTypeBt(_ sender: UIButton) {
       
        //typeArray.append()
        
       TableView.reloadData()
        
    }
    
    //Segment Type
    @IBOutlet weak var TypesSegmented: UISegmentedControl!
    
    
    
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

