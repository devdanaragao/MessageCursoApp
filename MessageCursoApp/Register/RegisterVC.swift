//
//  RegisterVC.swift
//  AppMessageNew
//
//  Created by Danilo Santos on 07/01/2024.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    var auth: Auth?
    var screen: RegisterScreen?
    var alert: Alert?
    
    override func loadView() {
        self.screen = RegisterScreen()
        self.view = self.screen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.screen?.configTextFieldDelegate(delegate: self)
        self.screen?.delegate(delegate: self)
        self.auth = Auth.auth()
        self.alert = Alert(controller: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

}

extension RegisterVC: RegisterScreenProtocol {
    func actionRegisterButton() {
        
        guard let register = self.screen else {return}
        
        self.auth?.createUser(withEmail: register.getEmail(), password: register.getPassword(), completion: { result, error in
            
            if error != nil {
                self.alert?.getAlert(titulo: "Atenção", mensagem: "Erro ao cadastrar, Verifique os dados e tente Novamente!")
            }else {
                self.alert?.getAlert(titulo: "Parabéns", mensagem: "Usuário cadastrado com sucesso", completion: {
                    self.navigationController?.popViewController(animated: true)
                })
            }
        })
    }
    
    func actionbackButton() {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RegisterVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.screen?.validaTextFields()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
    }
}
