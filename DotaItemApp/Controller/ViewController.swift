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
        
        // Menambahkan title pada navigation
        self.navigationItem.title = "Dota 2 Items"
        
        // let buttonProfile = UIBarButtonItem(image: UIImage(named: "profile"), style: .done, target: self, action: nil)
        let buttonProfile = UIBarButtonItem(title: "Profile", style: .done, target: self, action: #selector(ViewController.tapProfileButton))
        self.navigationItem.rightBarButtonItem = buttonProfile
        
        // Menghubungkan itemTableView dengan kedua metode dibawah
        heroTableView.dataSource = self
        
        // Menambahkan delegate ke table view
        heroTableView.delegate = self
        
        // Menghubungkan berkas XIB untuk DotaItemTableViewCell dengan itemTableView
        heroTableView.register(UINib(nibName: "DotaItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
    }
    
    @objc func tapProfileButton(){
        let profilePage = ProfileViewController()
        self.present(profilePage, animated: true)
    }


}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Digunakan untuk menambahkan total item yang akan muncul di dalam Table View
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Digunakan untuh menghubungkan cell dengan identifier "ItemCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! DotaItemTableViewCell
        
        // Menetapkan nilai item ke view di dalam cell
        let item = items[indexPath.row]
        cell.itemName.text = item.name
        cell.itemDesc.text = item.description
        cell.itemImage.image = item.image
        
        // Kode ini digunakan untuk membuat imageView memiliki frame bound/lingkaran
        cell.itemImage.layer.cornerRadius = cell.itemImage.frame.height / 2
        cell.itemImage.clipsToBounds = true
        
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Memanggil view controller dengan berkas NIB/XIB didalamnya
        let detail = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        // Mengirim data item
        detail.item = items[indexPath.row]
        
        // Push/mendorong view controller lain
        self.navigationController?.pushViewController(detail, animated: true)
    }
    
}
