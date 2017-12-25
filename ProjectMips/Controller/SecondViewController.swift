//
//  SecondViewController.swift
//  ProjectMips
//
//  Created by Amin Fadul on 12/25/17.
//  Copyright © 2017 ProjectMips. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController ,UITableViewDelegate,UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    var TableViewArray = [DataDependnse]()
    
    var NormalCC:Int?
    var PipeliningCC:Int?
    var ForwardingCC:Int?
    var NumberOfDependece:Int?
    
    @IBOutlet weak var FCCLabel: UILabel!
    @IBOutlet weak var PCCLabel: UILabel!
    @IBOutlet weak var CCLabel: UILabel!
    @IBOutlet weak var DataDepLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.reloadData()
        setLabelText()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return TableViewArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let result: UITableViewCell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "DataCell") as! DataDependTableViewCell
        cell.indexfromCell.text = String(TableViewArray[indexPath.row].IndexFrom)
        cell.indextoCell.text = String(TableViewArray[indexPath.row].IndexTo)
        cell.noStallCell.text = String(TableViewArray[indexPath.row].NumberOfStalls)
        cell.regfromCell.text = TableViewArray[indexPath.row].RegisterFrom
        cell.regtoCell.text = TableViewArray[indexPath.row].RegisterTo
        result = cell
        return result
    }

    
    func setLabelText() {
        CCLabel.text = ("\(NormalCC ?? 0)")
        PCCLabel.text = ("\(PipeliningCC ?? 0)")
        DataDepLabel.text = String(TableViewArray.count)
        FCCLabel.text = ("\(ForwardingCC ?? 0)")
    }

    @IBAction func BackButtonDo(_ sender: UIButton) {
        self.dismiss(animated: true ,completion: nil)
    }
}
