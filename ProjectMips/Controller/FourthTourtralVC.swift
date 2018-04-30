//
//  FourthTourtralVC.swift
//  ProjectMips
//
//  Created by Amin Fadul on 4/30/18.
//  Copyright © 2018 ProjectMips. All rights reserved.
//

import UIKit

class FourthTourtralVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func Begin(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "Begin", sender: nil)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
