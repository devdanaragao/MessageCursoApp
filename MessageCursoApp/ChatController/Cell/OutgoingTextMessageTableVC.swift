//
//  OutgoingTextMessageTableVC.swift
//  MessageCursoApp
//
//  Created by Danilo Santos on 16/01/2024.
//

import UIKit

class OutgoingTextMessageTableVC: UITableViewCell {

    static let identifier: String = String (describing: OutgoingTextMessageTableVC.self)
    
    lazy var myMessageMessage: UIView = {
       let bv = UIView()
        bv.translatesAutoresizingMaskIntoConstraints = false
        bv.backgroundColor = CustomColor.appPurple
        bv.layer.cornerRadius = 20
        bv.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner, .layerMaxXMinYCorner]
        return bv
    }()
    
    lazy var messageTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .white
        label.font = UIFont(name: CustomFont.poppinsSemiBold, size: 14)
        return label
    }()
    
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addElements()
        self.configConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addElements() {
        self.addSubview(self.myMessageMessage)
        self.myMessageMessage.addSubview(self.messageTextLabel)
        self.isSelected = false
    }
    
    public func setupCell(message: Message?){
        self.messageTextLabel.text = message?.texto ?? ""
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            self.myMessageMessage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.myMessageMessage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            self.myMessageMessage.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
            
            self.messageTextLabel.leadingAnchor.constraint(equalTo: self.myMessageMessage.leadingAnchor, constant: 15),
            self.messageTextLabel.topAnchor.constraint(equalTo: self.myMessageMessage.topAnchor, constant: 15),
            self.messageTextLabel.bottomAnchor.constraint(equalTo: self.myMessageMessage.bottomAnchor, constant: -15),
            self.messageTextLabel.trailingAnchor.constraint(equalTo: self.myMessageMessage.trailingAnchor, constant: -15),
        
        ])
    }

}
