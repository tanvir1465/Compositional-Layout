//
//  AppsSectionHeaderCell.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

class AppsSectionHeaderCell: UICollectionReusableView {
    
    static let reuseIdentifier: String = "AppsSectionHeaderCellId"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    lazy var seeAllButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    fileprivate func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [titleLabel, seeAllButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension AppsSectionHeaderCell {
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 6),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }
    
}
