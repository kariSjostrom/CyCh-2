//
//  LedgerTableViewController.swift
//  CyCh
//
//  Created by Karissa the Squid on 12/6/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//

import UIKit
import CoreData
import Foundation


class LedgerTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate {
    var filteredTableData = [NSManagedObject]()
    var resultSearchController = UISearchController()
    
    func updateSearchResultsForSearchController(searchController: UISearchController)
    {
        filteredTableData.removeAll(keepCapacity: false)
        //search for field in CoreData
        let searchPredicate = NSPredicate(format: "amount CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (transactionArray as NSArray).filteredArrayUsingPredicate(searchPredicate)
        filteredTableData = array as! [NSManagedObject]
        
        self.tableView.reloadData()
    }
    
    var transactionArray = [NSManagedObject]()
    
    override func viewWillAppear(animated: Bool) {
        super.viewDidAppear(animated)
        loaddb()
    }
    func loaddb()
    {
        
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        
        let fetchRequest = NSFetchRequest(entityName:"Contact")
        
        
        var error: NSError?
        
        
        //return contactArray.count
        do {
            let fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            if let results = fetchedResults {
                transactionArray = results
                tableView.reloadData()
            } else {
                print("Could not fetch \(error), \(error!.userInfo)")
            }
        } catch let error as NSError {
            // failure
            print("Fetch failed: \(error.localizedDescription)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.resultSearchController.delegate = self
        self.resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.delegate = self
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            controller.searchBar.delegate = self
            
            
            self.tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //6) Change to return contactArray.count
        
        if (self.resultSearchController.active) {
            return filteredTableData.count
        }
        else {
            return transactionArray.count
        }
        //return 0
        
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if (self.resultSearchController.active) {
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
                as UITableViewCell!
            let person = filteredTableData[indexPath.row]
            cell.textLabel?.text = person.valueForKey("amount") as! String?
            cell.detailTextLabel?.text = ">>"
            return cell
        }
        else {
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")
                as UITableViewCell!
            let person = transactionArray[indexPath.row]
            cell.textLabel?.text = person.valueForKey("amount") as! String?
            cell.detailTextLabel?.text = ">>"
            return cell
        }
        
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        print("You selected cell #\(indexPath.row)")
    }
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let appDelegate =
            UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            if (self.resultSearchController.active) {
                context.deleteObject(filteredTableData[indexPath.row])
            }
            else {
                context.deleteObject(transactionArray[indexPath.row])
            }
            
            var error: NSError? = nil
            do {
                try context.save()
                loaddb()
            } catch let error1 as NSError {
                error = error1
                print("Unresolved error \(error)")
                abort()
            }
        }
        
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "UpdateContacts" {
            if let destination = segue.destinationViewController as?
                ViewController {
                    if (self.resultSearchController.active) {
                        if let SelectIndex = tableView.indexPathForSelectedRow?.row {
                            let selectedDevice:NSManagedObject = filteredTableData[SelectIndex] as NSManagedObject
                            destination.transactiondb = selectedDevice
                            resultSearchController.active = false
                        }
                        
                    }
                    else {
                        if let SelectIndex = tableView.indexPathForSelectedRow?.row {
                            let selectedDevice:NSManagedObject = transactionArray[SelectIndex] as NSManagedObject
                            destination.transactiondb = selectedDevice
                        }
                        
                    }
                    
            }
        }
    }
    
    
}
