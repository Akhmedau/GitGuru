//
//  RegistrationFormViewController.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 15/07/2024.
//  Copyright © 2024 Ahmedov Nikolay. All rights reserved.
//

import UIKit
import SwiftyFORM

protocol RegistrationViewDelegate: AnyObject {
    func didTapSignInLabel()
}
class RegistrationFormViewController: FormViewController {
    
    weak var delegate: RegistrationViewDelegate?
    
    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Registration"
        builder += SectionHeaderTitleFormItem().title("Let's Get Started")
        builder += username
        builder += email
        builder += password
        builder += signUpButton
        builder += SectionHeaderTitleFormItem().title("Or Use Instant Sign Up")
        builder += googleButton
        builder += facebookButton
        builder += SectionHeaderTitleFormItem().title("Already have an account? Sign In")
    }
    lazy var username: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("Username").placeholder("Enter your username")
        return instance
    }()
    lazy var email: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("Email").placeholder("Enter your email")
        return instance
    }()
    lazy var password: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("Password").placeholder("Enter your password")
        return instance
    }()
    lazy var signUpButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title("Sign Up").backgroundColor(UIColor.orange)
        instance.action = {
            // Handle sign in action
        }
        return instance
    }()
    lazy var googleButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title("Google Account").backgroundColor(UIColor.systemGray5)
        instance.action = {
            // Handle sign in action
        }
        return instance
    }()
    lazy var facebookButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title("Facebook Account").backgroundColor(UIColor.systemGray5)
        instance.action = {
            // Handle sign in action
        }
        return instance
    }()
}
