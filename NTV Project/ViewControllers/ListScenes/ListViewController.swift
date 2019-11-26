//
//  ListViewController.swift
//  NTV Project
//
//  Created by Oktay on 20.11.2019.
//  Copyright © 2019 Oktay Kurt. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {
    // MARK: - UI Elements
    @IBOutlet weak var listTableView: UITableView!
    
    // MARK: - Stored Properties
    var list = ["Favoriler","Apple Haberleri","Hafta Sonu"]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    // MARK: - Functions
    func showAlert() {
        let alert = UIAlertController(title: "Yeni oluşturacağınız listeye bir isim verin", message: nil, preferredStyle: .alert)
        alert.addTextField { (textfield) in
            textfield.placeholder = "Liste Adı"
        }
        let action1 = UIAlertAction(title: "Oluştur", style: .default) { (UIAlertAction) in
            let textfield = alert.textFields![0] as UITextField
            
        }
        let action2 = UIAlertAction(title: "Vazgeç", style: .cancel, handler: nil)
        alert.addAction(action1)
        alert.addAction(action2)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Actions
    @IBAction func yeniListeEkleButtonTapped(_ sender: UIBarButtonItem) {
        showAlert()
    }
    
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ListsCell") as? ListsTableViewCell {
            cell.listName.text = list[indexPath.row]
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = CGFloat(80)
        return height
    }
    
    
}


    
    

