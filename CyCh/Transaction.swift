//
//  Transaction.swift
//  CyCh
//
//  Created by Karissa the Squid on 12/6/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//

import UIKit
import CoreData

@objc(Transaction)
class Transaction: NSManagedObject {
    
    @NSManaged var amount: String
    @NSManaged var date: String
    @NSManaged var notes: String
    @NSManaged var type: String

}
