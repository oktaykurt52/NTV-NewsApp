//
//  News2ViewController.swift
//  NTV Project
//
//  Created by Oktay on 19.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit
import SafariServices

class NewsDetailViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var newImageView: UIImageView!
    @IBOutlet weak var newTitleLabel: UILabel!
    @IBOutlet weak var newBacksceneTitleLabel: UILabel!
    @IBOutlet weak var newDescriptionLabel: UILabel!
    
    
    // MARK: - Stored Properties
    var newTitle: String?
    var newDescription: String?
    var newImage: String?
    var newLink: String?
    
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newImageView.image = getImageFromUrl(url: newImage!)
        newTitleLabel.text = newTitle
        newDescriptionLabel.text = newDescription
    }
    
    // MARK: - Functions
    
    
    func getImageFromUrl(url: String) -> UIImage? {
        let url = URL(string: url)
        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url!, options: [])
            
            //4. Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return image
    }
    
    // MARK: - Actions
    
    @IBAction func goToNewsSelf (_ sender: UIButton) {
        let url = URL(string: newLink!)
        let controller = SFSafariViewController(url: url!)
        present(controller, animated: true, completion: nil)
    }
}
