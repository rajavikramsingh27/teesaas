//
//  TermsAndConditionViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class TermsAndConditionViewController: UIViewController {

    @IBOutlet weak var titleTermsLbl: UILabel!
    var tilerText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleTermsLbl.text = tilerText

    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
   
}
