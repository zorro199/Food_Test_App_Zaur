//
//  PizzaViewController.swift
//  Food_Test_App
//
//  Created by Zaur on 22.06.2023.
//

import UIKit

class PizzaViewController: UIViewController {
    
    private let smileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = R.Images.Comon.sadSmile
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
    }
    
    func addViews() {
        view.addSubview(smileImageView)
        layoutViews()
    }
    
    func layoutViews() {
        NSLayoutConstraint.activate([
            smileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            smileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 60),
            smileImageView.heightAnchor.constraint(equalToConstant: 100),
            smileImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
