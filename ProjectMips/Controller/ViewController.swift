//
//  ViewController.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 17/11/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate,UITableViewDelegate,UITableViewDataSource {
    
     var typeArray = [String]()
    
    
    
    
    
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if ((typeArray[indexPath.row] as? String) != nil) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "R-TypeCells") as! R_TypeTableViewCell
            
            cell.RTypeOpCodeTextField.text = typeArray[indexPath.row]
            cell.RTypeRdTextField.text = typeArray[indexPath.row]
            cell.RTypeRsTextField.text = typeArray[indexPath.row]
            cell.RTypeRtTextField.text = typeArray[indexPath.row]
            
            
            return cell
        }
        
        if ((typeArray[indexPath.row] as? String) != nil) {
            
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "I-TypeCells") as! I_TypeTableViewCell
            cell2.ITypeRsTextField.text = typeArray[indexPath.row]
           
            
            return cell2
        }
        
        return UITableViewCell()
    }

    
   
    
    @IBOutlet weak var TableView: UITableView!
    
   
    @IBAction func addNewTypeBt(_ sender: UIButton) {
       
       TableView.reloadData()
        
    }
    
    //picker methods
    @IBOutlet weak var TypesPicker: UIPickerView!
    let pickerData = [["R-Type","I-Type"]]
    var SelectedType : String = ""
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData[component].count
    }
    
    
    
    //implement picker delegate
    func pickerView(_
        pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int
        ) -> String? {
        return pickerData[component][row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        SelectedType = pickerData[row]
        TableView.reloadData()
    }
   
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.delegate = self
        TypesPicker.delegate = self
        TypesPicker.dataSource = self
        TableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

