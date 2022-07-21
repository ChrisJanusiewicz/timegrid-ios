//
//  UITableView+Util.swift
//  Matrixx Mobile
//
//  Created by Chris J on 28/06/2022.
//  Copyright © 2022 Matrixx. All rights reserved.
//

import UIKit

extension UITableViewCell {
    static var reuseIdentifier: String { "\(Self.self)" }
}

extension UITableView {

    /// Generic convenience wrapper for registering cell types to a table view
    func register<Cell: UITableViewCell>(_ cellType: Cell.Type) {
        register(Cell.self, forCellReuseIdentifier: Cell.reuseIdentifier)
    }

    /// Generic convenience wrapper around dequeueing specific types of cells
    func dequeueReusableCell<Cell: UITableViewCell>(
        ofType: Cell.Type,
        for indexPath: IndexPath
    ) -> Cell {
        let genericCell = dequeueReusableCell(withIdentifier: Cell.reuseIdentifier, for: indexPath)
        guard let cell = genericCell as? Cell else {
            fatalError("Cannot cast reusable cell with identifier: \(Cell.reuseIdentifier) to \(Cell.self)")
        }
        return cell
    }

}
