//
//  ActivityTypeDAO+CoreDataClass.swift
//  TimeGrid
//
//  Created by Chris J on 17/07/2022.
//
//

import Foundation
import CoreData

@objc(ActivityTypeDAO)
public class ActivityTypeDAO: NSManagedObject, CoreDataEntity {
    public typealias EntityType = ActivityType

    @NSManaged public var activityTypeID: UUID
    @NSManaged public var name: String
    @NSManaged public var comment: String?

    @nonobjc
    public class func createFetchRequest() -> NSFetchRequest<ActivityTypeDAO> {
        NSFetchRequest<ActivityTypeDAO>(entityName: "ActivityTypeDAO")
    }

    public var domainEntity: ActivityType {
        ActivityType(id: activityTypeID, name: name, comment: comment)
    }

    public required convenience init(context: NSManagedObjectContext, entity: ActivityType) {
        self.init(context: context)
        activityTypeID = entity.id
        name = entity.name
        comment = entity.comment
    }
}

extension ActivityTypeDAO: Identifiable { }
