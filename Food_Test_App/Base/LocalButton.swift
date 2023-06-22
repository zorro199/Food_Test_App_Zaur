//
//  LocalButton.swift
//  Food_Test_App
//
//  Created by Zaur on 22.06.2023.
//

import UIKit

class LocalButton: UIButton {
    
    // Setting view
    private var lable: UILabel = {
        let lable = UILabel()
        lable.textAlignment = .center
        lable.textColor = R.Colors.cityColor
        lable.font = .systemFont(ofSize: 17, weight: .bold)
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable
    }()
    private var iconView: UIImageView = {
        let iconView = UIImageView()
        iconView.image = R.Images.Comon.downArrow
        iconView.translatesAutoresizingMaskIntoConstraints = false
        return iconView
    }()
    
    //MARK: - OVERRIDE init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String?) {
        lable.text = title
    }
    
}

private extension LocalButton {
    
    func addViews() {
        addSubviews([lable, iconView])
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            lable.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            lable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            lable.widthAnchor.constraint(equalToConstant: 70),
            lable.heightAnchor.constraint(equalToConstant: 30),
            
            iconView.centerYAnchor.constraint(equalTo: lable.centerYAnchor),
            iconView.leadingAnchor.constraint(equalTo: lable.trailingAnchor, constant: 5),
            iconView.widthAnchor.constraint(equalToConstant: 14),
            iconView.heightAnchor.constraint(equalToConstant: 7)
        ])
    }
    
}
