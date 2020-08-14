//
//  ThreeRowsAppsCell.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

class ThreeRowsAppsCell: UICollectionViewCell, ConfigurableAppCell {
    
    static var reuseIdentifier: String = "ThreeRowsAppsCellId"
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .secondaryLabel
        label.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 12
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("GET", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        return button
    }()
    
    var verticalStack: UIStackView!
    var horizontalStack: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackViews()
    }
    
    fileprivate func setupStackViews() {
        verticalStack = UIStackView(arrangedSubviews: [nameLabel, subtitleLabel])
        verticalStack.axis = .vertical
        horizontalStack = UIStackView(arrangedSubviews: [imageView, verticalStack, downloadButton])
        horizontalStack.axis = .horizontal
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.spacing = 10
        contentView.addSubview(horizontalStack)
        setConstraints()
    }
    
    func configure(with app: App) {
        nameLabel.text = app.name
        subtitleLabel.text = app.subtitle
        imageView.image = UIImage(named: app.image)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ThreeRowsAppsCell {
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            horizontalStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
}
