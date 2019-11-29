//
//  SignUpViewController.swift
//  NTV Project
//
//  Created by Oktay on 9.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    // MARK: - Stored Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // MARK: - Functions
    func showAlert(title: String, message: String) {
        // title ve message parametrerelerini kullanarak bir UIAlertController objesi oluşturur
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // "Done" adında bir aksiyon oluşturulur
        let doneAction = UIAlertAction(title: "Done", style: .default, handler: nil)
        
        // Oluşturulan aksiyon Alert'e eklenir.
        alert.addAction(doneAction)
        
        // Oluşturulan Alert'in ekranda gösterilmesi
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    // Beginning of SignUp activity;
    @IBAction func üyeolButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        // Securing for empty forms;
        guard !email.isEmpty, !password.isEmpty else {
            print("Tüm alanların girilmesi zorunludur.")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error)
            in
            if error == nil && result?.user != nil {
                // Success on Signup attempt
                let title = "Kayıt işlemi başarılı bir şekilde gerçekleşmiştir."
                let message = "Haberlerde gezinmeye başlayabilirsiniz."
                let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let action1 = UIAlertAction(title: "Uygulamaya Git", style: .default) { (UIAlertAction) in
                    // The segue after action performed.
                    self.performSegue(withIdentifier: "GoToMainApp2", sender: nil)
                }
                alert.addAction(action1)
                self.present(alert, animated: true, completion: nil)
            } else {
                // Failure on Signup attempt
                // We use 'switch' statement for error cases in order to understand to current issue on failure
                switch (error! as NSError).code {
                case 17007:
                    // issue: E-mail already exists.
                    // Alert;
                    self.showAlert(title: "Bu E-posta Adresi Kayıtlı", message: "Bu E-posta adresi ile daha önce bir kayıt oluşturuldu.")
                    
                case 17026:
                    // issue: Minimum character of password
                    // Alert;
                    self.showAlert(title: "Yetersiz şifre karakter sayısı", message: "Şifrenizin en az 6 karakterden oluştuğuna emin olun.")
                    
                case 17008:
                    // issue: Invalid of e-mail adress
                    // Alert;
                    self.showAlert(title: "Hatalı E-posta Adresi", message: "E-posta adresinizin doğru formatta olduğundan emin olun.")
                    
                default:
                    // issue: Unknown kind of error
                    // Alert;
                    self.showAlert(title: "Bilinmeyen Hata :(", message: "")
                }
            }
        }
        
        
    }
    
    
    
}

