//
//  makePaymentViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class makePaymentViewController: UIViewController {

    @IBOutlet weak var titleCourseLbl: UILabel!
    @IBOutlet weak var amountCourseLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func creditcardBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "addCardViewController") as! addCardViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func debitCardBtn(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "addCardViewController") as! addCardViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
