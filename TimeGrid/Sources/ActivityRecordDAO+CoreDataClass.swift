//
//  ActivityRecordDAO+CoreDataClass.swift
//  TimeGrid
//
//  Created by Chris J on 17/07/2022.
//
//

import Foundation
import CoreData

@objc(ActivityRecordDAO)
public class ActivityRecordDAO: NSManagedObject, CoreDataEntity {
    public typealias EntityType = ActivityRecord

    @NSManaged public var activityTypeID: UUID
    @NSManaged public var date: Date
    @NSManaged public var createdOn: Date
    @NSManaged public var modifiedOn: Date
    @NSManaged public var comment: String?

    @nonobjc
    public class func createFetchRequest() -> NSFetchRequest<ActivityRecordDAO> {
        NSFetchRequest<ActivityRecordDAO>(entityName: "ActivityRecordDAO")
    }

    public var domainEntity: ActivityRecord {
        ActivityRecord(
            activityTypeID: activityTypeID,
            date: date,
            createdOn: createdOn,
            modifiedOn: modifiedOn,
            comment: comment
        )
    }

    public required convenience init(context: NSManagedObjectContext, entity: ActivityRecord) {
        self.init(context: context)
        date = entity.date
        comment = entity.comment
        createdOn = entity.createdOn
        modifiedOn = entity.modifiedOn
        activityTypeID = entity.activityTypeID
    }
}

extension ActivityRecordDAO: Identifiable { }
