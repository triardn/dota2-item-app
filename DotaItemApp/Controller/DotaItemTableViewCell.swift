//
//  DotaItemTableViewCell.swift
//  DotaItemApp
//
//  Created by Tri Ardini on 24/06/20.
//  Copyright © 2020 BuruhKoding. All rights reserved.
//

import UIKit

class DotaItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemDesc: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
