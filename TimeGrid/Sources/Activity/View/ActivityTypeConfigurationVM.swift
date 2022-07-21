//
//  ActivityTypeConfigurationVM.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import Foundation

class ActivityTypeConfigurationVM {

    let service = ActivityService(
        activityRepository: CoreDataRepository<ActivityRecord, ActivityRecordDAO>(context: CoreDataManager.instance.container.viewContext),
        activityTypeRepository: CoreDataRepository<ActivityType, ActivityTypeDAO>(context: CoreDataManager.instance.container.viewContext)
    )
}
