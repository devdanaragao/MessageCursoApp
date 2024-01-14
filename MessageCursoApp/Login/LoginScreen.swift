//
//  LoginScreen.swift
//  AppMessageNew
//
//  Created by Danilo Santos on 04/01/2024.
//

import UIKit

protocol LoginScreenProtocol: AnyObject {
    func actionRegisterButton()
    func actionLoginButton()
}

class LoginScreen: UIView {
    
    private weak var delegate: LoginScreenProtocol?
    
    public func delegate(delegate: LoginScreenProtocol?) {
        self.delegate = delegate
    }
    
    static let identifier: String = String (describing: LoginScreen.self)
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.text = " Login "
        label.font = UIFont.boldSystemFont(ofSize: 30)
        //label.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0)
        label.textAlignment = .center
        return label
    }()
    
    lazy var logoAppImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "arrow.up.message.fill")
        image.contentMode = .scaleAspectFit
        //image.tintColor = .green
        image.tintColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1.0)
        return image
    }()
    
    lazy var emailTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        tf.borderStyle = .roundedRect
        tf.textContentType = .username
        tf.keyboardType = .emailAddress
        tf.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 2.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.text = "Danilo@gmail.com"
        return tf
    }()
    
    lazy var passwordTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.autocorrectionType = .no
        tf.backgroundColor = UIColor(red: 52/255, green: 52/255, blue: 52/255, alpha: 1.0) /* #343434 */
        tf.borderStyle = .roundedRect
        tf.keyboardType = .default
        tf.textContentType = .password
        tf.isSecureTextEntry = true
        tf.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: [NSAttributedString.Key.foregroundColor : UIColor.white.withAlphaComponent(0.4)])
        tf.textColor = .white
        tf.clipsToBounds = true
        tf.layer.cornerRadius = 12
        tf.layer.borderWidth = 2.0
        tf.layer.borderColor = UIColor.white.cgColor
        tf.text = "123456789"
        return tf
    }()
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.backgroundColor = UIColor(red: 187/255, green: 187/255, blue: 187/255, alpha: 1)
        button.backgroundColor = UIColor(red: 3/255, green: 58/255, blue: 51/255, alpha: 1)
        button.setTitle("Logar", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        button.clipsToBounds = true
        button.layer.cornerRadius = 8
        //button.tintColor = .white
        //button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(self.pressLoginButton), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Não tem conta? Cadastre-se", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        button.setTitleColor(.white, for: .normal)
        //button.tintColor = .white
        //button.setImage(UIImage(systemName: "xmark"), for: .normal)
        button.addTarget(self, action: #selector(pressRegisterButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func pressLoginButton(_ sender: UIButton) {
        delegate?.actionLoginButton()
    }
    
    @objc private func pressRegisterButton(_ sender: UIButton) {
        delegate?.actionRegisterButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configBackground()
        self.addElements()
        self.addConstraints()
        self.configButtonEnable(false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addElements() {
        self.addSubview(self.loginLabel)
        self.addSubview(self.logoAppImage)
        self.addSubview(self.emailTextField)
        self.addSubview(self.passwordTextField)
        self.addSubview(self.loginButton)
        self.addSubview(self.registerButton)
    }
    
    public func getEmail()-> String {
        return self.emailTextField.text ?? ""
    }
    
    public func getPassword()-> String {
        return self.passwordTextField.text ?? ""
    }
    
    private func configBackground() {
        self.backgroundColor = UIColor(red: 24/255, green: 117/255, blue: 104/255, alpha: 1.0)
    }
    
    public func validaTextFields() {
        let email: String = emailTextField.text ?? ""
        let password: String = passwordTextField.text ?? ""
        
        if !email.isEmpty && !password.isEmpty {
            configButtonEnable(true)
        } else {
            configButtonEnable(false)
        }
    }
    
    private func configButtonEnable(_ enable: Bool) {
        if enable {
            loginButton.setTitleColor(.white, for: .normal)
            loginButton.isEnabled = true
        } else {
            loginButton.setTitleColor(.lightGray, for: .normal)
            loginButton.isEnabled = false
        }
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate) {
        self.emailTextField.delegate = delegate
        self.passwordTextField.delegate = delegate
    }
    
    private func addConstraints() {
        NSLayoutConstraint.activate([
            
            self.loginLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20),
            self.loginLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            
            self.logoAppImage.topAnchor.constraint(equalTo: self.loginLabel.bottomAnchor, constant: 20),
            self.logoAppImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 60),
            self.logoAppImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -60),
            self.logoAppImage.heightAnchor.constraint(equalToConstant: 200),
            
            self.emailTextField.topAnchor.constraint(equalTo: self.logoAppImage.bottomAnchor, constant: 20),
            self.emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            self.emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            self.emailTextField.heightAnchor.constraint(equalToConstant: 45),
            
            self.passwordTextField.topAnchor.constraint(equalTo: self.emailTextField.bottomAnchor, constant: 15),
            self.passwordTextField.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.passwordTextField.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.passwordTextField.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.loginButton.topAnchor.constraint(equalTo: self.passwordTextField.bottomAnchor, constant: 15),
            self.loginButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.loginButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.loginButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
            
            self.registerButton.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 15),
            self.registerButton.leadingAnchor.constraint(equalTo: self.emailTextField.leadingAnchor),
            self.registerButton.trailingAnchor.constraint(equalTo: self.emailTextField.trailingAnchor),
            self.registerButton.heightAnchor.constraint(equalTo: self.emailTextField.heightAnchor),
        ])
    }

}
