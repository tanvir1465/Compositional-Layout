//
//  TwoRowsAppsCell.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

class TwoRowsAppsCell: UICollectionViewCell, ConfigurableAppCell {
    
    static var reuseIdentifier: String = "TwoRowsAppsCellId"
    
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
        let button = UIButton(type: .custom)
        button.setTitle("$ 0.99", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.backgroundColor = .systemGray6
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        button.layer.cornerRadius = 14
        return button
    }()
    
    var verticalStack: UIStackView!
    var horizontalStack: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackViews()
    }
    
    fileprivate func setupStackViews() {
        verticalStack = UIStackView(arrangedSubviews: [nameLabel, subtitleLabel, downloadButton])
        verticalStack.axis = .vertical
        verticalStack.alignment = .leading
        horizontalStack = UIStackView(arrangedSubviews: [imageView, verticalStack])
        horizontalStack.alignment = .center
        horizontalStack.axis = .horizontal
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.spacing = 12
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

extension TwoRowsAppsCell {
    
    fileprivate func setConstraints() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            imageView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9),
            downloadButton.heightAnchor.constraint(equalToConstant: 28),
            downloadButton.widthAnchor.constraint(equalToConstant: 60),
            horizontalStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            horizontalStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            horizontalStack.topAnchor.constraint(equalTo: contentView.topAnchor)
        ])
        verticalStack.setCustomSpacing(10, after: subtitleLabel)
    }
    
}
