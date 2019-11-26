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
    
    // MARK: - Actions
    @IBAction func üyeolButtonTapped(_ sender: UIButton) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        //
        guard !email.isEmpty, !password.isEmpty else {
            print("Tüm alanların girilmesi zorunludur.")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { (result, error)
            in
            if error == nil && result?.user != nil {
                // Success attempt on Signup activity
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
            // Failure on Signup activity
        }
      
            
        }
        
        
        
    }
}
