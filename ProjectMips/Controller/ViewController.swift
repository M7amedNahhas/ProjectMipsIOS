//
//  ViewController.swift
//  ProjectMips
//
//  Created by M7amedNahhas on 17/11/2017.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
   
    

   
    @IBAction func addNewTypeBt(_ sender: UIButton) {
        
    }
    
    //picker methods
    @IBOutlet weak var TypesPicker: UIPickerView!
    let pickerData = [["R-Type","I-Type","J-Type"]]
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
   
    
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        TypesPicker.delegate = self
        TypesPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

