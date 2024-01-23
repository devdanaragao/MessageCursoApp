//
//  ChatNavView.swift
//  MessageCursoApp
//
//  Created by Danilo Santos on 14/01/2024.
//

import UIKit

class ChatNavView: UIView {
    
    var controller: ChatVC? {
        didSet {
            self.backButton.addTarget(controller, action: #selector(ChatVC.pressBackButton), for: .touchUpInside)
        }
    }
    
    static let identifier: String = String (describing: ChatNavView.self)
    
    lazy var navBackgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 35
        view.layer.maskedCorners = [.layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor(white: 0, alpha: 0.05).cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 10)
        view.layer.shadowOpacity = 1
        view.layer.shadowRadius = 10
        return view
    }()
    
    lazy var navBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()
    
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.backgroundColor = CustomColor.appLight
        searchBar.clipsToBounds = true
        searchBar.layer.cornerRadius = 20
        searchBar.placeholder = "Pesquise aqui"
        return searchBar
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "back"), for: .normal)
//        button.addTarget(self, action: #selector(pressClosedButton), for: .touchUpInside)
        return button
    }()
    
    lazy var customImage: UIImageView = {
       let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.clipsToBounds = true
        img.layer.cornerRadius = 26
        img.image = UIImage(named: "imagem-perfil")
        return img
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addElements()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.navBackgroundView)
        self.navBackgroundView.addSubview(self.navBar)
        self.navBar.addSubview(self.searchBar)
        self.navBar.addSubview(self.backButton)
        self.navBar.addSubview(self.customImage)
        
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            self.navBackgroundView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBackgroundView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBackgroundView.topAnchor.constraint(equalTo: self.topAnchor),
            self.navBackgroundView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.navBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.navBar.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.navBar.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.navBar.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            self.backButton.leadingAnchor.constraint(equalTo: self.navBar.leadingAnchor, constant: 30),
            self.backButton.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.backButton.heightAnchor.constraint(equalToConstant: 30),
            self.backButton.widthAnchor.constraint(equalToConstant: 30),
            
            self.customImage.leadingAnchor.constraint(equalTo: self.backButton.trailingAnchor, constant: 20),
            self.customImage.heightAnchor.constraint(equalToConstant: 55),
            self.customImage.widthAnchor.constraint(equalToConstant: 55),
            self.customImage.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            
            self.searchBar.leadingAnchor.constraint(equalTo: self.customImage.trailingAnchor, constant: 20),
            self.searchBar.centerYAnchor.constraint(equalTo: self.navBar.centerYAnchor),
            self.searchBar.trailingAnchor.constraint(equalTo: self.navBar.trailingAnchor, constant: -20),
            self.searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            
        ])
    }
    
}
