//
//  ProfileEditingViewController.swift
//  NTV Project
//
//  Created by Oktay on 25.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit

class ProfileEditingViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var profileImageView: UIImageView!
    
    
    // MARK: - Stored Properties
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Functions
   
    
    // MARK: - Actions
    

}

extension ProfileEditingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        
        dismiss(animated: true) {
            UIView.transition(with: self.profileImageView, duration: 0.5, options: .transitionCrossDissolve, animations: {
                self.profileImageView.image = image
            }, completion: nil)
            
        }
        
    }
    
}
