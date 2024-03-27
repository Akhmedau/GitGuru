//
//  SwipeCell.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 18/12/2023.
//  Copyright © 2023 Ahmedov Nikolay. All rights reserved.
//

import Foundation
import UIKit


class SwipeCell: UICollectionViewCell {
    
    static let reuseIdentifier = "SwipeCell"
    
    let headlineLabel = UILabel()
    let subheadlineLabel = UILabel()
    let descriptionStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(headline: String, subheadline: String) {
        headlineLabel.text = headline
        subheadlineLabel.text = subheadline
    }
    
    func configure() {
        backgroundColor = UIColor(hex: "#6DA5C0FF")
        
        
        headlineLabel.textAlignment = .center
        headlineLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        headlineLabel.textColor = .label
        headlineLabel.numberOfLines = 0
        
        subheadlineLabel.textAlignment = .center
        subheadlineLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subheadlineLabel.textColor = .secondaryLabel
        subheadlineLabel.numberOfLines = 0
        
        descriptionStackView.addArrangedSubview(headlineLabel)
        descriptionStackView.addArrangedSubview(subheadlineLabel)
        
        descriptionStackView.axis = .vertical
        descriptionStackView.spacing = 10
        descriptionStackView.alignment = .center
        descriptionStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(descriptionStackView)
        
        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            headlineLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            headlineLabel.widthAnchor.constraint(equalToConstant: 333),
            headlineLabel.heightAnchor.constraint(equalToConstant: 229),
            
            descriptionStackView.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 150),
            descriptionStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            descriptionStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            descriptionStackView.heightAnchor.constraint(equalToConstant: 80)
        
        ])
    }
}
