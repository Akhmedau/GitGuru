//
//  QuickStartCell.swift
//  GitGuru
//
//  Created by АХМЕДОВ НИКОЛАЙ on 25/12/2023.
//  Copyright © 2023 Ahmedov Nikolay. All rights reserved.
//
//
//import Foundation
//import UIKit
//
//static let reuseIdentifier = "QuickStartCell"
//
//let actionTitleLabel = UILabel()
//let secondaryTitleLabel = UILabel()
//let quickImage = UIImage()
//let targetStackView = UIStackView()
//
//override init(frame: CGRect) {
//    super.init(frame: frame)
//    
//    configure()
//}
//
//required init?(coder: NSCoder) {
//    fatalError("init(coder:) has not been implemented")
//}
//
//func update(headline: String, subheadline: String) {
//    actionTitleLabel.text = headline
//    secondaryTitleLabel.text = subheadline
//}
//
//func configure() {
//
//
//actionTitleLabel.textAlignment = .center
//actionTitleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
//actionTitleLabel.textColor = .label
//actionTitleLabel.numberOfLines = 0
//
//secondaryTitleLabel.textAlignment = .center
//secondaryTitleLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
//secondaryTitleLabel.textColor = .secondaryLabel
//secondaryTitleLabel.numberOfLines = 0
//
//
//targetStackView.addArrangedSubview(actionTitleLabel)
//targetStackView.addArrangedSubview(secondaryTitleLabel)
//
//targetStackView.axis = .vertical
//targetStackView.spacing = 10
//targetStackView.alignment = .center
//targetStackView.translatesAutoresizingMaskIntoConstraints = false
//
//addSubview(targetStackView)
//}
