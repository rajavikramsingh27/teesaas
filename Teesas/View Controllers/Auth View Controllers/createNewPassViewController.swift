//
//  createNewPassViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class createNewPassViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func newPassBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
   

}
