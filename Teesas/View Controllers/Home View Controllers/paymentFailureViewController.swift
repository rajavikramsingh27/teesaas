//
//  paymentFailureViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class paymentFailureViewController: UIViewController {

    @IBOutlet weak var orderIdLbl: UILabel!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func tryAgainBtn(_ sender: Any) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "tabbar")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
