//
//  ActivityType.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import Foundation

// TODO consider making this a reference type. Impact on memory since ActivityRecord would hold a reference?
public struct ActivityType: Entity {
    let id: UUID
    let name: String
    let comment: String?
}
