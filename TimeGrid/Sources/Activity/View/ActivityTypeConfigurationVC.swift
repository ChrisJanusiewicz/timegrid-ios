//
//  ActivityTypeConfigurationVC.swift
//  TimeGrid
//
//  Created by Chris J on 19/07/2022.
//

import UIKit

class ActivityTypeConfigurationVC: UIViewController {

    let viewModel: ActivityTypeConfigurationVM

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    init(viewModel: ActivityTypeConfigurationVM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) { nil }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        layoutTableView()
    }

    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self

        tableView.register(ActivityTypeCell.self)
    }

    func layoutTableView() {
        view.addSubview(tableView)
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension ActivityTypeConfigurationVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: ActivityTypeCell.self, for: indexPath)

        if viewModel.activityTypes.indices.contains(indexPath.row) {
            let activityType = viewModel.activityTypes[indexPath.row]
            cell.viewModel = activityType
        }

        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.activityTypes.count + 1
    }
}

extension ActivityTypeConfigurationVC: UITableViewDelegate {

}
