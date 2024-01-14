//
//  ViewController.swift
//  AppMessageNew
//
//  Created by Danilo Santos on 04/01/2024.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    var auth:Auth?
    var screen: LoginScreen?
    var alert: Alert?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.configTextFieldDelegate(delegate: self)
        self.screen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
        
    }
    
    override func loadView() {
        self.screen = LoginScreen()
        view = screen
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}

extension LoginVC: LoginScreenProtocol {
    
    func actionRegisterButton() {
        let vc: RegisterVC = RegisterVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func actionLoginButton() {
        
//        let vc: HomeVC = HomeVC()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        guard let login = self.screen else {return}
        
        self.auth?.signIn(withEmail: login.getEmail(), password: login.getPassword(), completion: { usuario, error in
            
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Daddos Incorretos, verifique e tente Novamente!!")
            }else {
                
                if usuario == nil {
                    self.alert?.getAlert(titulo: "Atenção", mensagem: "Tivemos um problema inesperado, tente novamente mais tarde")
                } else {
                    let VC = HomeVC()
                    let navVC = UINavigationController(rootViewController: VC)
                    navVC.modalPresentationStyle = .fullScreen
                    self.present(navVC, animated: true, completion: nil)
                }
            }
            
        })
    }
}

extension LoginVC: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.screen?.validaTextFields()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
