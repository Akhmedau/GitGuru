//
//  ViewController.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 15/07/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class ViewController: UIViewController, LoginViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLoginForm()
    }

    private func setupLoginForm() {
        let loginFormVC = LoginFormViewController()
        loginFormVC.delegate = self
        addChild(loginFormVC)
        view.addSubview(loginFormVC.view)
        loginFormVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginFormVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            loginFormVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginFormVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginFormVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        loginFormVC.didMove(toParent: self)
    }

    func didTapForgotPasswordButton() {
        // Handle forgot password action
        print("Forgot Password tapped")
    }

    func didTapSignUpButton() {
        // Handle sign up action
        print("Sign Up tapped")
    }
}

