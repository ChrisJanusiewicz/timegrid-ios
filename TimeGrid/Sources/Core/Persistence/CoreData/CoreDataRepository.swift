//
//  CoreDataRepository.swift
//  TimeGrid
//
//  Created by Chris J on 18/07/2022.
//

import CoreData

/// Enum for CoreData related errors
enum CoreDataError: Error {
    case invalidManagedObjectType
}

/// Generic class for handling NSManagedObject subclasses.
public class CoreDataRepository<T, U>: Repository<T>
where T: Entity, U: NSManagedObject & CoreDataEntity, U.EntityType == T {

    /// The NSManagedObjectContext instance to be used for performing the operations.
    let managedObjectContext: NSManagedObjectContext

    /// Designated initializer.
    /// - Parameter context: The NSManagedObjectContext instance to be used for performing the operations.
    init(context moc: NSManagedObjectContext) {
        self.managedObjectContext = moc
    }

    /// Gets an array of NSManagedObject entities.
    /// - Parameters:
    ///   - predicate: The predicate to be used for fetching the entities.
    ///   - sortDescriptors: The sort descriptors used for sorting the returned array of entities.
    /// - Returns: A result consisting of either an array of NSManagedObject entities or an Error.
    override func get(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[T], RepositoryError> {
        let fetchRequest = U.fetchRequest()
        fetchRequest.predicate = predicate
        fetchRequest.sortDescriptors = sortDescriptors
        do {
            let fetchResults = try managedObjectContext.fetch(fetchRequest)
            guard let objects = fetchResults as? [U] else {
                return .failure(.persistenceError(wrappedError: CoreDataError.invalidManagedObjectType))
            }
            let entities = objects.map { $0.domainEntity }
            return .success(entities)
        } catch {
            return .failure(.persistenceError(wrappedError: error))
        }
    }

    /// Creates a NSManagedObject entity.
    /// - Returns: A result consisting of either a NSManagedObject entity or an Error.
    @discardableResult
    override func insert(entity: T) -> Result<T, RepositoryError> {
        let object = U(context: managedObjectContext, entity: entity)
        do {
            try managedObjectContext.save()
            return .success(entity)
        } catch {
            return .failure(.persistenceError(wrappedError: error))
        }
    }

    override func delete(entity: T) -> Result<Bool, RepositoryError> {
        // TODO: find it, return true if found and deleted, return false if not found
        // managedObjectContext.delete(entity)
        return .success(true)
    }
}
