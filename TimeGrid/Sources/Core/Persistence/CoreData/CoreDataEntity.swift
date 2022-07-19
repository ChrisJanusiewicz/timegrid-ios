//
//  CoreDataEntity.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import CoreData

// Implemented by NSManagedObject subclasses
public protocol CoreDataEntity {
    associatedtype EntityType

    init(context: NSManagedObjectContext, entity: EntityType)
    var domainEntity: EntityType { get }
}
