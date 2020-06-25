//
//  ViewController.swift
//  DotaItemApp
//
//  Created by Tri Ardini on 24/06/20.
//  Copyright © 2020 BuruhKoding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heroTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Dota 2 Items"
        
        let buttonProfile = UIBarButtonItem(title: "Profile", style: .done, target: self, action: #selector(ViewController.tapProfileButton))
        self.navigationItem.rightBarButtonItem = buttonProfile
        
        heroTableView.dataSource = self
        
        heroTableView.delegate = self
        
        heroTableView.register(UINib(nibName: "DotaItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
    }
    
    @objc func tapProfileButton(){
        let profilePage = ProfileViewController()
        self.present(profilePage, animated: true)
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as? DotaItemTableViewCell
        
        let item = items[indexPath.row]
        cell?.itemName.text = item.name
        cell?.itemDesc.text = item.description
        cell?.itemImage.image = item.image
        cell?.itemImage.clipsToBounds = true
        
        return cell ?? DotaItemTableViewCell()
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detail.item = items[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}
