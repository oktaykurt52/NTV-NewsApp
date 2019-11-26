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
     func startActivityIndicator() {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.center = self.view.center
        self.view.addSubview(activityView)
        activityView.startAnimating()
    }
    
    // MARK: - Actions
    @IBAction func girisyapButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        //
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
                // Failure in signup attempt.
            let title = "Bu mail adresi ile daha önce kullanıcı oluşturulmamıştır."
            let message = "'Üye ol' sayfasına gidiniz"
            let alert1 = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let action1 = UIAlertAction(title: "Sayfaya Git", style: .default) { (UIAlertAction) in
            self.performSegue(withIdentifier: "UserCreationNeededToPerform", sender: nil)
                }
            alert1.addAction(action1)
            self.present(alert1, animated: true, completion: nil)
            }
        }
    }

}
