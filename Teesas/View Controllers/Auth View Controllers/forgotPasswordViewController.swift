//
//  forgotPasswordViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class forgotPasswordViewController: UIViewController {

    @IBOutlet weak var selectCodeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.selectCodeBtn.setTitle(countryCodeSelected, for: .normal)
    }
   
    @IBAction func countryCodeSelectBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "phoneNumberViewController") as! phoneNumberViewController
        presentPanModal(vc)
    }
    
    @IBAction func forgotPassBtn(_ sender: custom_button) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "otpViewController") as! otpViewController
        vc.isFromForgotPass = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
