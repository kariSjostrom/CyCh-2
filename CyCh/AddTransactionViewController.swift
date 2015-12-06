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
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext
    
     
    
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var amount: UITextField!

    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var ttype: UITextField!
    @IBOutlet weak var type: UIPickerView!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func btnSave(sender: AnyObject) {
        // Save
        let appDel: AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        let context: NSManagedObjectContext = appDel.managedObjectContext
        
        let ent = NSEntityDescription.entityForName("Transaction", inManagedObjectContext: context)
        
        //Reference to entity
        let newTransaction = Transaction(entity: ent!, insertIntoManagedObjectContext: context)
        
        //Core Data
        newTransaction.amount = amount.text!
        newTransaction.notes = notes.text!
        // (PickerView) newTransaction.type = type.text!
        
//        let dateFormatter = NSDateFormatter()
//        var curLocale: NSLocale = NSLocale.currentLocale()
//        var formatString: NSString = NSDateFormatter.dateFormatFromTemplate(<#T##tmplate: String##String#>, options: <#T##Int#>, locale: <#T##NSLocale?#>)
        
        ;
        
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
