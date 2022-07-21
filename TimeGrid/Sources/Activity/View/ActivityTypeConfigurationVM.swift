//
//  ActivityTypeConfigurationVM.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import Foundation

class ActivityTypeConfigurationVM {

    let service: ActivityService

    init(service: ActivityService) {
        self.service = service
    }

    var activityTypes: [ActivityType] {
        service.getActivityTypes()
    }
}
