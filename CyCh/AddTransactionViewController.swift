//
//  AddTransactionViewController.swift
//  CyCh
//
//  Created by Karissa the Squid on 12/6/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//

import UIKit
import CoreData

class AddTransactionViewController: UIViewController {
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var amount: UITextField!

    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var type: UIPickerView!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func btnSave(sender: AnyObject) {
    }
    
    @IBAction func btnClear(sender: AnyObject) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
