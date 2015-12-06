//
//  Transaction+CoreDataProperties.swift
//  CyCh
//
//  Created by Karissa the Squid on 12/6/15.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension transaction {

    @NSManaged var Amount: String?
    @NSManaged var Type: NSObject?
    @NSManaged var Notes: String?
    @NSManaged var Date: NSDate?

}
