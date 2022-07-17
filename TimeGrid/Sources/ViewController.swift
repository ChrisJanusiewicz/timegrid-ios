//
//  ViewController.swift
//  TimeGrid
//
//  Created by Chris J on 17/07/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        UIView.animate(withDuration: 0.5) {
            self.view.backgroundColor = .systemPurple
        }
    }
}
