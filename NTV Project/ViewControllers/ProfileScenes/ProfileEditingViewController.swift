//
//  ProfileEditingViewController.swift
//  NTV Project
//
//  Created by Oktay on 25.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class ProfileEditingViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userLastNameTextField: UITextField!
    @IBOutlet weak var userInterestsTextField: UITextField!
    // MARK: - Stored Properties
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Functions
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let actionSignOut = UIAlertAction(title: "Çıkış Yap", style: .default) { (UIAlertAction) in
            let firebaseAuth = Auth.auth()
            do {
                if firebaseAuth.currentUser != nil {
                    try firebaseAuth.signOut()
                    if let storyboard = self.storyboard {
                        let vc = storyboard.instantiateViewController(withIdentifier: "firstNavigationController") as! UINavigationController
                        self.present(vc, animated: false, completion: nil)
                    }
                }
            } catch let signOutError as NSError {
                print ("Error signing out: \(signOutError)")
            }
            
        }
        
        alert.addAction(actionCancel)
        alert.addAction(actionSignOut)
        present(alert, animated: true, completion: nil)
    }
    
    func createImagePickerController(sourceType: UIImagePickerController.SourceType) -> UIImagePickerController {
        // Create an imagepicker object
        let imagePickerController = UIImagePickerController()
        
        // Select a sourcetype in image picking alternatives
        imagePickerController.sourceType = sourceType
        
        // Is photo editing enabled or not
        imagePickerController.allowsEditing = true
        
        // Configure the delegate of imagepicking function
        imagePickerController.delegate = self
        
        return imagePickerController
    }
    
    
    // MARK: - Actions
    @IBAction func takePhotoFromLibrary(_ sender: UITapGestureRecognizer) {
        let imagepicker = createImagePickerController(sourceType: .photoLibrary)
        present(imagepicker, animated: true, completion: nil)
    }
    
    @IBAction func saveEditedProfileButtonTapped(_ sender: UIButton) {
        
    }
    
    @IBAction func logOutButtonTapped(_ sender: UIButton) {
        showAlert(title: "Çıkış yapmak üzeresiniz", message: "Eminmisin?")
        
    }
    
    
}

extension ProfileEditingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // info, fotoğraf seçme işlemi hakkında detaylı bilgi verir.
        // 'UIImagePickerController.InfoKey' kullanılarak objenin tüm değerlerine ulaşılır.
        let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage
        
        // 'imageView' arayüz elamanının 'image' özelliği, seçilen görsel ile güncellenir.
        profileImageView.image = image
        
        // Tüm işlem tamamlandıktan sonra aktif olan 'UIImagePickerController' sayfası kapatılır.
        dismiss(animated: true, completion: nil)
    }
    
}
