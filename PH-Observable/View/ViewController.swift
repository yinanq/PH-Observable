//
//  ViewController.swift
//  PH-Observable
//
//  Created by Yinan Qiu on 6/1/20.
//  Copyright © 2020 Yinan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var user = User(name: Observable("Test"))
    
    let usernameTextField = BoundTextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        usernameTextField.bind(to: user.name)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.user.name.value = "test update from the model side"
        }
    }

    private func configure() {
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.text = "test"
        usernameTextField.textAlignment = .center
        usernameTextField.textColor = .white
        view.addSubview(usernameTextField)
        NSLayoutConstraint.activate([
            usernameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            usernameTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}

