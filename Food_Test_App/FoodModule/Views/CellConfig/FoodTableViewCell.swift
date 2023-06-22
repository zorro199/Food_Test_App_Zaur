//
//  FoodTableViewCell.swift
//  Food_Test_App
//
//  Created by Zaur on 05.04.2023.
//

import UIKit
import SDWebImage

class FoodTableViewCell: UITableViewCell {
    static let reuseID = "Foodcell"
    
    //MARK: - VIEWS
    
    private let foodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let foodNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let foodDescriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = R.Colors.descriptionLabel
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18)
        label.clipsToBounds = true
        label.layer.cornerRadius = 8
        label.layer.borderColor = R.Colors.borderPriceLabel.cgColor
        label.layer.borderWidth = 1
        label.textAlignment = .center
        label.backgroundColor = .white
        label.textColor = R.Colors.borderPriceLabel
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            contentView.backgroundColor = .white
        }
    }
    
    //MARK: - INIT
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(_ model: FoodModel) {
        guard let imageUrl = URL(string: model.image ?? "nil") else { return }
        let foodName = model.name ?? "nil"
        let descriptionFoodName = model.description ?? "nil"
        let foodPrice = model.price ?? 0
        self.foodImageView.sd_setImage(with: imageUrl)
        self.foodNameLabel.text = foodName
        self.foodDescriptionLabel.text = descriptionFoodName
        self.priceLabel.text = String(foodPrice)
    }
    
    //MARK: - SETUP VIEWS
    
    private func addViews() {
        contentView.addSubviews([foodImageView, foodNameLabel,
                                 foodDescriptionLabel, priceLabel])
    }
    
    private func layoutViews() {
        NSLayoutConstraint.activate([
            foodImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            foodImageView.widthAnchor.constraint(equalToConstant: 150),
            foodImageView.heightAnchor.constraint(equalToConstant: 150),
            foodImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            //labelFoodName
            foodNameLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 32),
            foodNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            foodNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            foodNameLabel.heightAnchor.constraint(equalToConstant: 20),
            //labelFoodDescription
            foodDescriptionLabel.topAnchor.constraint(equalTo: foodNameLabel.bottomAnchor, constant: 8),
            foodDescriptionLabel.leadingAnchor.constraint(equalTo: foodImageView.trailingAnchor, constant: 32),
            foodDescriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            foodDescriptionLabel.heightAnchor.constraint(equalToConstant: 80),
            //labelPrice
            priceLabel.topAnchor.constraint(equalTo: foodDescriptionLabel.bottomAnchor, constant: 16),
            priceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            priceLabel.widthAnchor.constraint(equalToConstant: 90),
            priceLabel.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

}

