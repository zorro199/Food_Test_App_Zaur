//
//  HeaderView.swift
//  Food_Test_App
//
//  Created by Zaur on 22.06.2023.
//

import UIKit

class HeaderView: UIView {
    
    private lazy var bannerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var menuViewMock: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let bannersViewController = Banners()
    
    func setupChild() {
        bannerView.addSubview(bannersViewController.view)
        bannersViewController.view.frame = bannerView.bounds
    }
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.backgroundColor = R.Colors.barColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    var constraint: NSLayoutConstraint?
    
    var height: CGFloat = 250 {
        didSet {
            let diagramAlpha = 1.0 - (maxHeight - height > 90.0 ? 90.0 : maxHeight - height) / 90.0
            bannerView.alpha = diagramAlpha
            
            if diagramAlpha < 0.3 {
                bannerView.isHidden = true
                self.layer.shadowColor = UIColor.black.cgColor
                self.layer.shadowOpacity = 0.5
                self.layer.shadowOffset = CGSize(width: 0, height: 3)
                self.layer.shadowRadius = 3
            } else {
                bannerView.isHidden = false
                self.layer.shadowColor = UIColor.white.cgColor
                self.layer.shadowOpacity = 0
                self.layer.shadowOffset = CGSize(width: 0, height: 0)
                self.layer.shadowRadius = 0
            }
            layoutIfNeeded()
        }
    }
    
    var maxHeight: CGFloat = 250
    var minHeight: CGFloat = 50
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupChild()
        addSubview(stackView)
        NSLayoutConstraint.activate([
            bannerView.heightAnchor.constraint(equalToConstant: 150),
            menuViewMock.heightAnchor.constraint(equalToConstant: 50),
            
            stackView.topAnchor.constraint(equalTo: self.topAnchor),
            stackView.leftAnchor.constraint(equalTo: self.leftAnchor),
            stackView.rightAnchor.constraint(equalTo: self.rightAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        [bannerView, menuViewMock].forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
