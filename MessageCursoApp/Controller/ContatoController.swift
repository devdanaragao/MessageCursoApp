//
//  ContatoController.swift
//  MessageCursoApp
//
//  Created by Danilo Santos on 14/01/2024.
//

import Foundation
import UIKit
import FirebaseFirestore

protocol ContatoProtocol: AnyObject {
    func alertStateError(titulo: String, message: String)
    func sucessContato()
}

class ContatoController {
    
    private weak var delegate: ContatoProtocol?
    
    public func delegate(delegate: ContatoProtocol?) {
        self.delegate = delegate
    }
    
    func addContact(email: String, emailUsuarioLogado: String, idUsuario: String){
        
        if email == emailUsuarioLogado {
            self.delegate?.alertStateError(titulo: "Você adicionou o seu próprio email", message: "Adicione um email diferente")
            return
        }
        // verificar se existe usuario no firebase
        let firestore = Firestore.firestore()
        firestore.collection("usuarios").whereField("email", isEqualTo: email).getDocuments { snapshotResultado, error in
            
            // Conta total de retorno
            if let totalItens = snapshotResultado?.count {
                if totalItens == 0 {
                    self.delegate?.alertStateError(titulo: "Usuario não cadastrado", message: "Verifque o e-mail e tente novamente")
                    return
                }
            }
            
            // Salvar contato
            if let snapshot = snapshotResultado {
                for document in snapshot.documents {
                    let dados = document.data()
                    self.salvarContato(dadosContato: dados, idUsuario: idUsuario)
                }
            }
        }
        
    }
    
    func salvarContato(dadosContato: Dictionary<String,Any>, idUsuario: String){
        let contact: Contact = Contact(dicionario: dadosContato)
        let firestore: Firestore = Firestore.firestore()
        firestore.collection("usuarios").document(idUsuario).collection("contatos").document(contact.id ?? "").setData(dadosContato){(error) in
            if error == nil {
                self.delegate?.sucessContato()
            }
        }
    }
    
}
