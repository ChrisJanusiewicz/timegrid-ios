//
//  SceneDelegate.swift
//  TimeGrid
//
//  Created by Chris J on 17/07/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        let coreDataContext = CoreDataManager.instance.container.viewContext
        let activityRepository = CoreDataRepository<ActivityRecord, ActivityRecordDAO>(context: coreDataContext)
        let activityTypeRepository = CoreDataRepository<ActivityType, ActivityTypeDAO>(context: coreDataContext)

        // TODO: hardcode this elsewhere with some better checks (only ~10 records - could consider fetching from API?)
        prepopulateTypes(repository: activityTypeRepository)

        window.rootViewController = ActivityTypeConfigurationVC(
            viewModel: ActivityTypeConfigurationVM(service: ActivityService(
                activityRepository: activityRepository,
                activityTypeRepository: activityTypeRepository
            ))
        )
        window.makeKeyAndVisible()
    }

    private func prepopulateTypes(repository: Repository<ActivityType>) {
        var activityTypesToAdd: [ActivityType] = [
            ActivityType(id: UUID(), name: "Sleep", comment: "Sleeping, or actively trying to fall asleep"),
            ActivityType(id: UUID(), name: "Downtime", comment: "Scheduled break/active rest"),
            ActivityType(id: UUID(), name: "Work", comment: "Billable hours"),
            ActivityType(id: UUID(), name: "Travel/Groceries", comment: nil),
            ActivityType(id: UUID(), name: "Chores", comment: nil),
            ActivityType(id: UUID(), name: "Prep/Eating", comment: "Self-care, cooking, eating"),
            ActivityType(id: UUID(), name: "Family", comment: "Dedicated special time for SO/Family"),
            ActivityType(id: UUID(), name: "Social", comment: "Dedicated special time with friends"),
            ActivityType(id: UUID(), name: "Wasted Time", comment: "Procrastination"),
            ActivityType(id: UUID(), name: "Exercise", comment: nil),
            ActivityType(id: UUID(), name: "Productivity", comment: "Personal development"),
        ]
        switch repository.get(predicate: nil, sortDescriptors: nil) {
        case .success(let existingTypes):
            let existingTypeNames = existingTypes.map { $0.name }
            activityTypesToAdd = activityTypesToAdd.filter { !existingTypeNames.contains($0.name) }
        case .failure(let error):
            print("Unable to fetch existing activity types: \(error)")
        }

        activityTypesToAdd.forEach { activityType in
            repository.insert(entity: activityType)
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see
        // `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}
