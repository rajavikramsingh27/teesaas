//
//  contactInfoViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class contactInfoViewController: UIViewController {

    @IBOutlet weak var nameTf: DesignableUITextField!
    @IBOutlet weak var phoneNumberTf: UITextField!
    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var emailAddressTf: DesignableUITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        self.countryCodeBtn.setTitle(countryCodeSelected, for: .normal)
    }
    
    @IBAction func proceedToPayment(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "makePaymentViewController") as! makePaymentViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func selectCountryCode(_ sender: Any) {
        let story = UIStoryboard(name: "Auth", bundle: nil)
        let vc = story.instantiateViewController(withIdentifier: "phoneNumberViewController") as! phoneNumberViewController
        presentPanModal(vc)
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
