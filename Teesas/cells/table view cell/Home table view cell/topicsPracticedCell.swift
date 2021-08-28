//
//  topicsPracticedCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 18/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class topicsPracticedCell: UITableViewCell {

    @IBOutlet weak var topicImage: UIImageView!
    @IBOutlet weak var topicTitlebl: UILabel!
    @IBOutlet weak var topicLevelLbl: UILabel!
    @IBOutlet weak var topicGoingLbl: UILabel!
    @IBOutlet weak var selectCellBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
