//
//  ActivityTypeCell.swift
//  TimeGrid
//
//  Created by Chris J on 21/07/2022.
//

import UIKit

class ActivityTypeCell: UITableViewCell {

    private let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let commentLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let contentStack: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        return stackView
    }()

    required init?(coder: NSCoder) { nil }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        layoutContents()
    }

    var viewModel: ActivityType? {
        didSet {
            if let viewModel = viewModel {
                bind(viewModel)
            }
        }
    }

    private func bind(_ viewModel: ActivityType) {
        iconView.image = UIImage(systemName: "bed.double")
        nameLabel.text = viewModel.name
        commentLabel.text = viewModel.comment
    }

    private func layoutContents() {
        contentView.addSubview(contentStack)
        contentStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        contentStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        contentStack.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        contentStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

        contentStack.addArrangedSubview(iconView)
        contentStack.addArrangedSubview(nameLabel)
    }
}
