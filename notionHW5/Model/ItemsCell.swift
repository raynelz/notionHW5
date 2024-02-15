//
//  ItemsTableViewCell.swift
//  notionHW5
//
//  Created by Захар Литвинчук on 12.02.2024.
//

import UIKit

class ItemsTableViewCell: UITableViewCell {
    
    private let iconImageView = UIImageView()
    private let label = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    public func configure(with model: ItemsModel) {
        label.text = model.title
        iconImageView.image = model.icon
    }

}

private extension ItemsTableViewCell {
    func embedViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
    }
}

private extension ItemsTableViewCell {
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            iconImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            iconImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            label.leadingAnchor.constraint(equalTo: iconImageView.trailingAnchor, constant: 16),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
        
    }
}

private extension ItemsTableViewCell {
    func setupAppearance() {
        accessoryType = .disclosureIndicator
        
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = .darkGray
        
        label.numberOfLines = 1
        
    }
}
