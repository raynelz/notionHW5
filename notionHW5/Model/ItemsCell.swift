//
//  ItemsTableViewCell.swift
//  notionHW5
//
//  Created by Захар Литвинчук on 12.02.2024.
//

import UIKit

class ItemsCell: UITableViewCell {
    
    //MARK: - UI Elements
    let iconImage = UIImageView()
    let nameLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        embedViews()
        setupLayout()
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - embedViews
private extension ItemsCell {
    
    func embedViews() {
        [iconImage, nameLabel].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview($0)
        }
    }
    
}

//MARK: - setupLayout
private extension ItemsCell {
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            iconImage.heightAnchor.constraint(equalToConstant: 24),
            iconImage.widthAnchor.constraint(equalToConstant: 24),
            
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 10),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
    }
    
}

//MARK: - setupAppearance
private extension ItemsCell {
    
    func setupAppearance() {
        self.backgroundColor = UIColor.clear
        nameLabel.font = .systemFont(ofSize: 14)
        nameLabel.textColor = .white
        
        iconImage.tintColor = .white
    }
    
}

//MARK: - Configure
extension ItemsCell {
    func configure(item: Items) {
        iconImage.image = item.icon
        nameLabel.text = item.title
    }
}
