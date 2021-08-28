
//
//  recentTestCollectionViewCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 06/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import KDCircularProgress

class recentTestCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var progressView: KDCircularProgress!
    @IBOutlet weak var progressPrecentageLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var retestBtn: UIButton!
    @IBOutlet weak var analysisBtn: UIButton!
    
}
