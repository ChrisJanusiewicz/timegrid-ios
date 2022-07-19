//
//  AcitivityRecordRepository.swift
//  TimeGrid
//
//  Created by Chris J on 17/07/2022.
//

import Foundation
import CoreData

public struct ActivityRecord: Entity {
    let activityTypeID: UUID
    let date: Date
    let createdOn: Date
    let modifiedOn: Date
    let comment: String?
}

// TODO consider making this a reference type. Impact on memory since ActivityRecord would hold a reference?
public struct ActivityType: Entity {
    let id: UUID
    let name: String
    let comment: String?
}

// TODO: I think we need a special TimeInterval struct that validates 30 minute slots
// TODO: best way to store this?
