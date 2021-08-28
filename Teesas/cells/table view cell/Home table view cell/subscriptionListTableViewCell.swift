//
//  subscriptionListTableViewCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class subscriptionListTableViewCell: UITableViewCell {

    @IBOutlet weak var subscriptionTitleLbl: UILabel!
    @IBOutlet weak var subscriptionPriceLbl: UILabel!
    @IBOutlet weak var subscriptionDetailsLbl: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
