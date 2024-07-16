import UIKit
import SwiftyFORM

protocol LoginViewDelegate: AnyObject {
    func didTapForgotPasswordButton()
    func didTapSignUpButton()
}

class LoginFormViewController: FormViewController, LoginViewDelegate {

    weak var delegate: LoginViewDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func populate(_ builder: FormBuilder) {
        builder.navigationTitle = "Login"
        builder += SectionHeaderTitleFormItem().title("Hello !")
        builder += SectionHeaderTitleFormItem().title("Welcome to GitGuru")
        builder += username
        builder += password
        builder += forgotPasswordButton
        builder += signInButton
        builder += SectionHeaderTitleFormItem().title("Don't have an account?")
        builder += signUpButton
    }

    lazy var username: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("Username").placeholder("Enter your username")
        return instance
    }()

    lazy var password: TextFieldFormItem = {
        let instance = TextFieldFormItem()
        instance.title("Password").placeholder("Enter your password").password()
        return instance
    }()

    lazy var forgotPasswordButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title("Forgot Password?")
        instance.action = { [weak self] in
            self?.didTapForgotPasswordButton()
        }
        return instance
    }()

    lazy var signInButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title("Sign In").backgroundColor(UIColor.orange)
        instance.action = { [weak self] in
            self?.didTapSignInButton()
        }
        return instance
    }()

    lazy var signUpButton: ButtonFormItem = {
        let instance = ButtonFormItem()
        instance.title("Sign Up").backgroundColor(.clear)
        instance.action = { [weak self] in
            self?.didTapSignUpButton()
        }
        return instance
    }()

    func didTapForgotPasswordButton() {
        let forgotPasswordVC = ForgotPasswordFormViewController()
        navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
    
    func didTapSignInButton() {
        let oneTutorialVC = OneTutorialVC()
        navigationController?.pushViewController(oneTutorialVC, animated: true)
        print("Sign In tapped")
    }

    func didTapSignUpButton() {
        let registrationFormVC = RegistrationFormViewController()
        navigationController?.pushViewController(registrationFormVC, animated: true)
        print("Sign Up tapped")
    }
}
