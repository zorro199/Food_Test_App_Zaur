//
//  MenuCollectionViewCell.swift
//  Food_Test_App
//
//  Created by Zaur on 05.04.2023.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    static var reuseId = "MenuCollectionViewCell"
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = R.Colors.isLabelDeSelect
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = self.isSelected ? R.Colors.isSelect : .white
            self.nameLabel.textColor = R.Colors.isLabelSelect
            self.nameLabel.font = self.isSelected ? UIFont.systemFont(ofSize: 18, weight: .bold) : UIFont.systemFont(ofSize: 17, weight: .regular)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.layer.borderColor = R.Colors.isLabelDeSelect.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 22
        contentView.addSubview(nameLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor)
        ])
    }
    
}

