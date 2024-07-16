import UIKit

class TwoTutorialVC: UIViewController {
    
    let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.isEditable = false
        textView.isScrollEnabled = true
        textView.translatesAutoresizingMaskIntoConstraints = false
        
        let attributedText = NSMutableAttributedString(
            string: "What is git ?\n",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.white]
        )
        
        attributedText.append(NSAttributedString(
            string: "Git is a mature, actively maintained open source revision control system\n\n",
            attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: "What is a version control system ?\n",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: """
            Version control is a system that records changes to a file or set of files over time so that you can recall specific versions later.

            It allows you to revert selected files back to a previous state, revert the entire project back to a previous state, compare changes over time, see who last modified something that might be causing a problem, who introduced an issue and when, and more.\n\n
            """,
            attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: "What makes git distributed ?\n",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: """
            The complete project, includes its full history, is mirrored on every developer’s computer. Typically, another copy is kept in a central place like Github, Bitbucket or GitLab, but this is not mandatory.\n\n
            """,
            attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: "What is Git Guru ?\n",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: "Just a friendly app aiming to help you use git.\n\n",
            attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: "Is git hard to use ?\n",
            attributes: [.font: UIFont.boldSystemFont(ofSize: 20), .foregroundColor: UIColor.white]
        ))
        
        attributedText.append(NSAttributedString(
            string: "You’ll get the hang of it.\n\n",
            attributes: [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.white]
        ))
        
        textView.attributedText = attributedText
        return textView
    }()
    
    let coreConceptsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Core concepts", for: .normal)
        button.backgroundColor = UIColor(red: 0.0, green: 0.48, blue: 1.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(coreConceptsButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.12, green: 0.33, blue: 0.41, alpha: 1.00)
        setupView()
        setupConstraints()
    }
    
    private func setupView() {
        view.addSubview(textView)
        view.addSubview(coreConceptsButton)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textView.bottomAnchor.constraint(equalTo: coreConceptsButton.topAnchor, constant: -20),
            
            coreConceptsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            coreConceptsButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            coreConceptsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            coreConceptsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func coreConceptsButtonTapped() {
        let twoTutorialVC = TwoTutorialVC()
        navigationController?.pushViewController(twoTutorialVC, animated: true)
    }
}

