//
//  MessageLastVC.swift
//  MessageCursoApp
//
//  Created by Danilo Santos on 14/01/2024.
//

import UIKit

class MessageLastVC: UICollectionViewCell {
    
    static let identifier: String = String (describing: MessageLastVC.self)
    
    lazy var imageView: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        img.clipsToBounds = false
        img.image = UIImage(systemName: "person.badge.plus")
        return img
    }()
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adicionar novo Contato"
        label.font = UIFont(name: CustomFont.poppinsMedium, size: 16)
        label.textColor = .darkGray
        label.numberOfLines = 2
        return label
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
        self.addSubview(self.imageView)
        self.addSubview(self.userName)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            self.imageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.imageView.widthAnchor.constraint(equalToConstant: 55),
            self.imageView.heightAnchor.constraint(equalToConstant: 55),
            
            self.userName.leadingAnchor.constraint(equalTo: self.imageView.trailingAnchor, constant: 15),
            self.userName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            self.userName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
    
}
