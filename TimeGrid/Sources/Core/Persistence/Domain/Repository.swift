//
//  Repository.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import Foundation

// Business layer Entity, with no knowledge of the Persistence layer
public protocol Entity { }

enum RepositoryError: Error {
    case abstractRepository
    case persistenceError(wrappedError: Error)
}

/// Defines the operations one can perform on a repository
public class Repository<T> where T: Entity {

    /// Abstract class
    internal init() { }

    func get(
        predicate: NSPredicate?,
        sortDescriptors: [NSSortDescriptor]?
    ) -> Result<[T], RepositoryError> {
        .failure(.abstractRepository)
    }

    @discardableResult
    func insert(entity: T) -> Result<T, RepositoryError> { .failure(.abstractRepository) }

    /// Deletes a NSManagedObject entity.
    /// - Parameter entity: The NSManagedObject to be deleted.
    /// - Returns: A result consisting of either a Bool set to true or an Error.
    func delete(entity: T) -> Result<Bool, RepositoryError> { .failure(.abstractRepository) }
}
