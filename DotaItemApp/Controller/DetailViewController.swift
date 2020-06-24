//
//  DetailViewController.swift
//  DotaItemApp
//
//  Created by Tri Ardini on 24/06/20.
//  Copyright © 2020 BuruhKoding. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemDesc: UILabel!
    
    // Digunakan untuk menampung data Item
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Digunakan untuk menetapkan nilai item ke beberapa view yang ada
        if let result = item {
            itemName.text = result.name
            itemDesc.text = result.description
            itemImage.image = result.image
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
