//
//  ActivityRecord.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import Foundation

public struct ActivityRecord: Entity {
    let activityTypeID: UUID
    let date: Date // TODO: I think we need a special time type that validates X minute slots. Best way to store this?
    let createdOn: Date
    let modifiedOn: Date
    let comment: String?
}
