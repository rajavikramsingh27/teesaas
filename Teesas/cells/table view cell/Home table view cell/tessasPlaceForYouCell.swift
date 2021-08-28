//
//  tessasPlaceForYouCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 16/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class tessasPlaceForYouCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var shadowView: shadow_uiview!
    @IBOutlet weak var titleLbl: UILabel!
  
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imgView.roundCorners(corners: [.topLeft,.topRight], radius: 16.0)

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
