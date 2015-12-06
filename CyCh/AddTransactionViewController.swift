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
    var transactiondb:NSManagedObject!
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext


    @IBAction func btnHome(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }

    @IBAction func btnView(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var amount: UITextField!

    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var ttype: UITextField!
    @IBOutlet weak var type: UIPickerView!
    @IBOutlet weak var status: UILabel!
    
    @IBAction func btnSave(sender: AnyObject) {
        if (transactiondb != nil)
        {
            transactiondb.setValue(amount.text, forKey: "amount")
            transactiondb.setValue(notes.text, forKey: "description")
            transactiondb.setValue(ttype.text, forKey: "type")
            //transactiondb.setValue(date)
            //???transactiondb.setValue(type??)
        }
        else
        {
            let entityDescription =
            NSEntityDescription.entityForName("Transaction",inManagedObjectContext: managedObjectContext)
            
            let transaction = Transaction(entity: entityDescription!,
                insertIntoManagedObjectContext: managedObjectContext)
            
            transaction.amount = amount.text!
            transaction.notes = notes.text!
            transaction.type = ttype.text!
        }
        var error: NSError?
        do {
            try managedObjectContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        
        if let err = error {
            status.text = err.localizedFailureReason
        } else {
            self.dismissViewControllerAnimated(false, completion: nil)
            
        }
                
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
