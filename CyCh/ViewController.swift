//
//  ViewController.swift
//  CyCh
//
//  Created by Karissa the Squid on 12/5/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var Funds: UILabel!
    
    @IBOutlet var datePicker:UIDatePicker!
   

    
    var transactiondb:NSManagedObject!
    let managedObjectContext =
    (UIApplication.sharedApplication().delegate
        as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //new method hiding keyboard
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches , withEvent: event)
    }
    //set delegate to all uitextfields
    func textFieldShouldReturn(textField: UITextField!) -> Bool {
        self.view.endEditing(true)
        return false
    }

    func FundsAvaailable()
    {
        // The idea would be to calculate total available funds by comparing it to Spending, savings, and income. So,
        // Total available = bank balance - savings - spending + income
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName:"Total")
        let error: NSError?
        
    /* Need to fix the Total Funds available calculator
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                Funds.text = ("===\(results)"); print(Funds.text);
                // Calculate the grand total...
                var totalAvailable = 0
                var savings = 0
                var spending = 0
                var income = 0
                for order in results {
                    
                    let value = valueForKey(transaction.amount, ForKey: "amount") as! Int
                    if {transaction.type = saving;)
                        then; transaction.amount = savings as int
                    }
                    if {transaction.type = spending
                        then; transaction.amount = spending as int
                    }
                    if {transaction.type = income
                        then; transaction.amount = income as int
                        }
                    }
                    totalAvailable += income - spending - saving
                }
        Funds.text = ("\(totalAvailable)"); print(Funds.text);
            } else {
                Funds.text = ("$0.00")
            }
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        } */
    
    }

}
