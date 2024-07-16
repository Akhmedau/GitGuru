import UIKit
import SwiftyFORM


class ForgotPasswordFormViewController: FormViewController {

    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Forgot Password"
        builder += SectionHeaderTitleFormItem().title("Forgot Password")
        builder += SectionHeaderTitleFormItem().title("Enter your email account to reset your password")
        builder += email
        builder += phoneNumber
        builder += continueButton
    }

    lazy var email: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("Email").placeholder("Enter your email")
        instance.keyboardType(.emailAddress)
        return instance
    }()

    lazy var phoneNumber: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("Phone Number").placeholder("Enter your phone number")
        instance.keyboardType(.phonePad)
        return instance
    }()

    lazy var continueButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title("Continue")
        instance.action = {
            // Handle continue action
            print("Continue button tapped")
        }
        return instance
    }()
}
