//
//  chatMessageCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 18/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class chatMessageCell: UITableViewCell {

    @IBOutlet weak var messageLbl: customLabelChat!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var backView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

class customLabelChat: UILabel {
    override func drawText(in rect: CGRect) {
        let insets = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        super.drawText(in: rect.inset(by: insets))
    }
}
