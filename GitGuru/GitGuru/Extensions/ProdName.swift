//
//  ProdName.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 18/12/2023.
//  Copyright © 2023 Ahmedov Nikolay. All rights reserved.
//

import UIKit

class ProdName{

var controller: UIViewController
var view: UIView

    private var headerStack = UIStackView()

init(controller: UIViewController) {
    self.controller = controller
    self.view = controller.view
}
    func createAppHeader(title: String){
        headerStack = {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.distribution = .equalSpacing
            stack.alignment = .center
            stack.translatesAutoresizingMaskIntoConstraints = false
            return stack
        }()
        var headerLabel: UILabel {
            let label = UILabel()
            label.text = title
            label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
            label.textColor = .white
            label.numberOfLines = 0
            return label
        }
        
    func createLabel(size: Float, weight: UIFont.Weight, text: String) -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = text
            //label.numberOfLines = 0
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: CGFloat(size), weight: weight)
            return label
        }
        do {
            let stack = UIStackView()
            stack.axis = .vertical
            
            stack.spacing = 27
            stack.alignment = .center
            stack.distribution = .fillEqually
            stack.translatesAutoresizingMaskIntoConstraints = false
        
        }
                
        headerStack.addArrangedSubview(headerLabel)
        
        view.addSubview(headerStack)
        
        NSLayoutConstraint.activate([
            headerStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            headerStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            headerStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
        ])
}


}

