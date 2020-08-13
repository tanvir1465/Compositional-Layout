//
//  FeaturedAppsCell.swift
//  CompositionalLayout
//
//  Created by Tanvir Hasan Piash on 14/8/20.
//  Copyright © 2020 Tanvir Hasan Piash. All rights reserved.
//

import UIKit

class FeaturedAppsCell: UICollectionViewCell, ConfigurableAppCell {
    
    static var reuseIdentifier: String = "FeaturedAppsCellId"
    
    lazy var taglineLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemBlue
        label.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        return label
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.preferredFont(forTextStyle: .title2)
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
        view.contentMode = .scaleAspectFit
        view.layer.cornerRadius = 6
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
    }
    
    fileprivate func setupStackView() {
        let stackView = UIStackView(arrangedSubviews: [taglineLabel, nameLabel, subtitleLabel, imageView])
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        setConstraints(to: stackView)
    }
    
    func configure(with app: App) {
        taglineLabel.text = app.tagline
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

// MARK: Layout Constraints
extension FeaturedAppsCell {
    
    fileprivate func setConstraints(to view: UIStackView) {
        NSLayoutConstraint.activate([
            view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            view.topAnchor.constraint(equalTo: contentView.topAnchor),
            view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
        view.setCustomSpacing(12, after: subtitleLabel)
    }
    
}
