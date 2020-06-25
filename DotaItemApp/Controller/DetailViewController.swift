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
    
    var item: Item?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let result = item {
            itemName.text = result.name
            itemDesc.text = result.description
            itemImage.image = result.image
        }
    }
}
