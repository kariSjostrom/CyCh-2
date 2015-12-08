//
//  Transaction+CoreDataProperties.swift
//  CyCh
//
//  Created by Charles Konkol on 2015-12-07.
//  Copyright © 2015 Rock Valley College. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Transaction {

    @NSManaged var amount: String?
    @NSManaged var date: String?
    @NSManaged var notes: String?
    @NSManaged var type: String?

}
