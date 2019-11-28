//
//  ProfileViewController.swift
//  NTV Project
//
//  Created by Oktay on 25.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProfileViewController: UIViewController {
    
    // MARK: - UI Elements
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userInterestsLabel: UILabel!
    @IBOutlet weak var readNewsTableView: UITableView!
    
    // MARK: - Stored Properties
    var ref = Database.database().reference()
    var readNews = [Item]()
    var account: Account?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.async {
            self.readNewsTableView.reloadData()
            
        }
        
    }
    
    // MARK: - Functions
    func getImageFromUrl(url: String) -> UIImage? {
        let url = URL(string: url)
        var image: UIImage? = nil
        do {
            //3. Get valid data
            let data = try Data(contentsOf: url!)
            
            //4. Make image
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        
        return image
    }
    
    
    // MARK: - Actions
    @IBAction func unwindSegueFromProfileEditingScene(_ sender: UIStoryboardSegue) {
            if let source = sender.source as? ProfileEditingViewController {
                source.profileImageView.image = profileImageView.image
                source.userInterestsTextField.text = userInterestsLabel.text
            
        }
    }
    
}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readNews.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let news = readNews[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ReadNews") as? NewsTableViewCell {
            cell.newTitleLabel.text = news.title
            cell.newDateLabel.text = news.pubDate
            let imageUrl = news.thumbnail
            cell.newImageView.image = getImageFromUrl(url: imageUrl!)
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let titleForTableView = "Okunan Haberler"
        return titleForTableView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let titleHeight = 50
        return CGFloat(titleHeight)
    }
    
    
}
