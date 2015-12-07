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
        
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                Funds.text = ("===\(results)")
                // Calculate the grand total...
                var totalAvailable = 0
                for order in results {
                    let saving = valueForKey(transaction.amount, forKey: "amount") as! Int
                    let spending = order.valueForKey("spending") as! Int
                    let income = order.valueForKey("income") as! Int
                    totalAvailable += income - spending - saving
                }
                Funds.text = ("\(totalAvailable)")
            } else {
                Funds.text = ("$0.00")
            }
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
    }

}

