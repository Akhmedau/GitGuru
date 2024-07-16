import UIKit

    class OneTutorialVC : UIViewController {
        
        let welcomeLabel: UILabel = {
            let label = UILabel()
            label.text = "Welcome!"
            label.font = UIFont.boldSystemFont(ofSize: 24)
            label.textColor = .white
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let descriptionLabel: UILabel = {
            let label = UILabel()
            label.text = "Would you like to follow the tutorial?\nYou can also reach it from the menu."
            label.font = UIFont.systemFont(ofSize: 16)
            label.textColor = .white
            label.textAlignment = .center
            label.numberOfLines = 0
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        let maybeLaterButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Maybe later", for: .normal)
            button.backgroundColor = .white
            button.setTitleColor(.black, for: .normal)
            button.layer.cornerRadius = 5
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        let yesGoButton: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Yes, go!", for: .normal)
            button.backgroundColor = .clear
            button.setTitleColor(.white, for: .normal)
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.white.cgColor
            button.layer.cornerRadius = 5
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(yesGoButtonTapped), for: .touchUpInside)
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor(red: 0.12, green: 0.33, blue: 0.41, alpha: 1.00)
            setupView()
            setupConstraints()
        }
        
        private func setupView() {
            view.addSubview(welcomeLabel)
            view.addSubview(descriptionLabel)
            view.addSubview(maybeLaterButton)
            view.addSubview(yesGoButton)
        }
        
        private func setupConstraints() {
            NSLayoutConstraint.activate([
                welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
                welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                
                descriptionLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20),
                descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                
                maybeLaterButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20),
                maybeLaterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
                maybeLaterButton.widthAnchor.constraint(equalToConstant: 150),
                maybeLaterButton.heightAnchor.constraint(equalToConstant: 44),
                
                yesGoButton.topAnchor.constraint(equalTo: maybeLaterButton.topAnchor),
                yesGoButton.leadingAnchor.constraint(equalTo: maybeLaterButton.trailingAnchor, constant: 20),
                yesGoButton.widthAnchor.constraint(equalTo: maybeLaterButton.widthAnchor),
                yesGoButton.heightAnchor.constraint(equalTo: maybeLaterButton.heightAnchor)
            ])
        }
        @objc private func yesGoButtonTapped() {
                let twoTutorialVC = TwoTutorialVC()
                navigationController?.pushViewController(twoTutorialVC, animated: true)
            }
        }
    
