//
//  termsAndConditionsViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 18/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class termsAndConditionsViewController: UIViewController {

    @IBOutlet weak var textViewData: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
