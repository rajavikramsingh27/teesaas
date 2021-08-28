//
//  fileChatCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 18/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class fileChatCell: UITableViewCell {
    
    @IBOutlet weak var fileNameLbl: UILabel!
    @IBOutlet weak var fileSelectBtn: UIButton!
    @IBOutlet weak var backView: shadow_uiview!
    @IBOutlet weak var viewContainer: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
