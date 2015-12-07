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
    @IBOutlet weak var tdate: UITextField!
    @IBOutlet weak var amount: UITextField!
    @IBOutlet weak var notes: UITextField!
    @IBOutlet weak var ttype: UITextField!
    @IBOutlet weak var type: UIPickerView!
    @IBOutlet weak var status: UILabel!
    @IBOutlet weak var btnSave: UIButton!
    
    @IBAction func btnSave(sender: AnyObject) {
        if (transactiondb != nil)
        {
            transactiondb.setValue(amount.text, forKey: "amount")
            transactiondb.setValue(notes.text, forKey: "description")
            transactiondb.setValue(ttype.text, forKey: "type")
            transactiondb.setValue(tdate.text, forKey: "date")
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
            transaction.date = tdate.text!
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (transactiondb != nil)
        {
            amount.text = transactiondb.valueForKey("amount") as? String
            notes.text = transactiondb.valueForKey("notes") as? String
            ttype.text = transactiondb.valueForKey("type") as? String
            tdate.text = transactiondb.valueForKey("date") as? String
            btnSave.setTitle("Update", forState: UIControlState.Normal)
        }
        amount.becomeFirstResponder()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        //Adds tap gesture to view
        view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches , withEvent:event)
        if let touch = touches.first as UITouch! {
            DismissKeyboard()
        }
    }

    func DismissKeyboard(){
        amount.endEditing(true)
        notes.endEditing(true)
        ttype.endEditing(true)
        tdate.endEditing(true)
        
    }
    func textFieldShouldReturn(textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        return true;
    }

    
    @IBAction func btnClear(sender: AnyObject) {
        
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(nil, forKey: "amount")
        defaults.setObject(nil, forKey: "type")
        defaults.setObject(nil, forKey: "date")
        defaults.setObject(nil, forKey: "notes")
        defaults.setObject(selectedtype, forKey: "type")
        
        defaults.synchronize()
        
        amount.text = ""
        notes.text = ""
        ttype.text = ""
        tdate.text = ""
        type.selectRow(0,inComponent: 0, animated: true)
        amount.becomeFirstResponder()
        
    }
    
    var selectedtype:String!
    let pickertype = ["Savings","Spending","Income"]
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickertype.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        selectedtype=pickertype[row]
        if (selectedtype=="Saving")
        {
            self.view.backgroundColor = UIColor.whiteColor()
        }
        if (selectedtype=="Spending")
        {
            self.view.backgroundColor = UIColor.redColor()
        }
        if (selectedtype=="Income")
        {
            self.view.backgroundColor = UIColor.yellowColor()
        }
        
        return pickertype[row]
        
    }
    
}
