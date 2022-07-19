//
//  ViewController.swift
//  TimeGrid
//
//  Created by Chris J on 17/07/2022.
//

import UIKit

class ViewController: UIViewController {

    let service = ActivityService(
        activityRepository: CoreDataRepository<ActivityRecord, ActivityRecordDAO>(context: CoreDataManager.instance.container.viewContext),
        activityTypeRepository: CoreDataRepository<ActivityType, ActivityTypeDAO>(context: CoreDataManager.instance.container.viewContext)
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .systemBlue

        let stuff = service.getActivityRecords(from: Date().addingTimeInterval(-3600), to: Date().addingTimeInterval(-1800))
        print(stuff)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 1.0) {
            self.view.backgroundColor = .systemPurple
        }
    }
}

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
