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
    var new: Item!
    var readNews = [Item]()
    
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newImageView.image = getImageFromUrl(url: new.thumbnail!)
        newTitleLabel.text = new.title
        newDescriptionLabel.text = new.description
        
    }
    
    // MARK: - Functions
    func showAlert() {
        let title = "Haber 'okunan haberler' listesine eklendi"
        let message = "Gezinmeye devam et"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Devam et", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    @IBAction func addToListButtonTapped(_ sender: UIButton) {
        
    }
    
    
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
        let url = URL(string: new.link!)
        let controller = SFSafariViewController(url: url!)
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func markAsReadButtonTapped(_ sender: UIButton) {
        let item = new
        readNews.append(item!)
        print(readNews)
        showAlert()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ProfileViewController  {
            destination.readNews = readNews
        }
    }
}
