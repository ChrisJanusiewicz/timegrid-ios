//
//  ActivityService.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import Foundation

class ActivityService {
    let activityRepository: Repository<ActivityRecord>
    let activityTypeRepository: Repository<ActivityType>

    init(activityRepository: Repository<ActivityRecord>, activityTypeRepository: Repository<ActivityType>) {
        self.activityRepository = activityRepository
        self.activityTypeRepository = activityTypeRepository
    }

    func getActivityTypes() -> [ActivityType] {
        switch activityTypeRepository.get(predicate: nil, sortDescriptors: nil) {
        case .success(let records):
            return records
        case .failure(let error):
            print(error)
            return []
        }
    }

    func addActivityType(activityType: ActivityType) {
        activityTypeRepository.insert(entity: activityType)
    }

    func getActivityRecords(from startDate: Date, to endDate: Date) -> [ActivityRecord] {
        let filter = NSPredicate(format: "date >= %@ AND date <= %@", startDate as CVarArg, endDate as CVarArg)
        switch activityRepository.get(predicate: filter, sortDescriptors: nil) {
        case .success(let records):
            return records
        case .failure(let error):
            print(error)
            return []
        }
    }
}
