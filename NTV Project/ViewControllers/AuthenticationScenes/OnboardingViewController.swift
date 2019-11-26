//
//  ViewController.swift
//  NTV Project
//
//  Created by Oktay on 9.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit
import FirebaseAuth

class OnboardingViewController: UIViewController {
    // MARK: - UI Elements
    
    // MARK: - Stored Properties
    var authHandler: AuthStateDidChangeListenerHandle?
    var isLoggedIn = false
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        authHandler = Auth.auth().addStateDidChangeListener({ (auth, user) in
            if Auth.auth().currentUser != nil {
                // User is signed in.
                // ...
            } else {
                // No user is signed in.
                // ...
            }
        })
    }
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        if let handler = authHandler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
    }
    
    // MARK: - Functions
    
    // MARK: - Actions
    @IBAction func girisButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "GoToLoginScene", sender: nil)
    }
    
    @IBAction func üyeolButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSignUpScene", sender: nil)
    }
    
    
}

