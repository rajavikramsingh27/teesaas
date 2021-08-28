//
//  MockExamsCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 16/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class MockExamsCell: UITableViewCell {

    @IBOutlet weak var testImage: UIImageView!
    @IBOutlet weak var testTitle: UILabel!
    @IBOutlet weak var testSubtitleLbl: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var titleTestItemLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
