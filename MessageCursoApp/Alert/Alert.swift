//
//  Alert.swift
//  AppMessageNew
//
//  Created by Danilo Santos on 09/01/2024.
//

import Foundation
import UIKit

// preferredStyle:
// actionSheet = Parte inferior da tela
// Alert = Centralizado na tela

class Alert: NSObject {
    
    var controller: UIViewController
    
    init (controller: UIViewController) {
        self.controller = controller
    }
    
    func getAlert(titulo: String, mensagem: String, completion:(() -> Void)? = nil) {
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let cancelar = UIAlertAction(title: "Ok", style: .cancel) { acao in
            completion?()
        }
        alertController.addAction(cancelar)
        self.controller.present(alertController, animated: true, completion: nil)
    }
    
}
