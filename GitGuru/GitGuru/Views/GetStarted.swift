//
//  GetStarted.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 25/12/2023.
//  Copyright © 2023 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class MyViewController: UIViewController {

    override func viewDidLoad() {
        view.backgroundColor = UIColor(hex: "#6DA5C0FF")
        super.viewDidLoad()

        // Создаем текстовые метки для двух абзацев текста
        let paragraph1Label = UILabel()
        paragraph1Label.text = "Git can be used from the command line, or via variious graphical front-ends. Git Guru focuses on the command line, as we feel it is the best way to learn git."
        paragraph1Label.numberOfLines = 0 // Разрешаем неограниченное количество строк
        paragraph1Label.translatesAutoresizingMaskIntoConstraints = false

        let paragraph2Label = UILabel()
        paragraph2Label.text = "1.  Download and install git from https://git-sci.com. If you are on Window, use the ‘git bash’ terminal that comes with Git for Windows. On Mac or Linux, just use the system terminal."
        paragraph2Label.numberOfLines = 0
        paragraph2Label.translatesAutoresizingMaskIntoConstraints = false

        // Создаем кнопку выхода
        let exitButton = UIButton()
        exitButton.setTitle("Exit", for: .normal)
        exitButton.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        exitButton.translatesAutoresizingMaskIntoConstraints = false


        // Добавляем все элементы на View
        view.addSubview(paragraph1Label)
        view.addSubview(paragraph2Label)
        view.addSubview(exitButton)
 //       view.addSubview(linkLabel)

        // Определяем constraints для элементов
        NSLayoutConstraint.activate([
            paragraph1Label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            paragraph1Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            paragraph1Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            paragraph2Label.topAnchor.constraint(equalTo: paragraph1Label.bottomAnchor, constant: 20),
            paragraph2Label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            paragraph2Label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            exitButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            exitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),


        ])
    }

    @objc func exitButtonTapped() {
                // Создаем следующий UIViewController
            let nextViewController = MyCollectionViewController()

            // Создаем UINavigationController и устанавливаем его корневой контроллер
            let navigationController = UINavigationController(rootViewController: nextViewController)

            // Переходим на следующий экран с анимацией
            navigationController.modalPresentationStyle = .fullScreen
            present(navigationController, animated: true, completion: nil)
    }

}
