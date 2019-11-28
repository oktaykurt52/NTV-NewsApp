//
//  LoginViewController.swift
//  NTV Project
//
//  Created by Oktay on 9.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    // MARK: - Stored Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // MARK: - Functions
    // In progress view;
    func startActivityIndicator() {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    func showAlert(title: String, message: String) {
        // title ve message parametrerelerini kullanarak bir UIAlertController objesi oluşturur
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // "Done" adında bir aksiyon oluşturulur
        let doneAction = UIAlertAction(title: "Tekrar", style: .default, handler: nil)
        
        // Oluşturulan aksiyon Alert'e eklenir.
        alert.addAction(doneAction)
        
        // Oluşturulan Alert'in ekranda gösterilmesi
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func girisyapButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        // Securing for empty forms;
        guard !email.isEmpty, !password.isEmpty else {
            let title = "Tüm alanların girilmesi zorunludur!"
            let message = "Tekrar deneyiniz."
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "Done", style: .cancel, handler: nil)
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error == nil && result?.user != nil {
                self.startActivityIndicator()
                // Signup attempt completed successfully.
                self.performSegue(withIdentifier: "GoToMainApp", sender: nil)
            } else {
                // Error during login attempt.
                // We control errors with 'switch' statement
                switch (error! as NSError).code {
                case 17011:
                    // issue: No user found
                    // Alert;
                    self.showAlert(title: "Kullanıcı Bulunamadı", message: "E-posta adresinizi ve şifrenizi kontrol edin.")
                    
                case 17009:
                    // issue: Wrong Password
                    // Alert;
                    self.showAlert(title: "Hatalı Şifre", message: "Şifrenizi doğru girdiğinizden emin olun.")
                    
                default:
                    // issue: Unknown kind of error
                    // Alert;
                    self.showAlert(title: "Bilinmeyen Hata :(", message: "")
                }
            }
        }
    }
    
}
