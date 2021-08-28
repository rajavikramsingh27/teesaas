//
//  loginViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 02/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import PanModal

var countryCodeSelected = "+91"

class loginViewController: UIViewController {

    @IBOutlet weak var numberTF: UITextField!
    @IBOutlet weak var passwordTF: DesignableUITextField!
    @IBOutlet weak var countryCodeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.countryCodeBtn.setTitle(countryCodeSelected, for: .normal)
    }
    
    @IBAction func loginBtn(_ sender: custom_button) {
        let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "tabbar")
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func ForgotPasw(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "forgotPasswordViewController") as! forgotPasswordViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func selectCountryCode(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "phoneNumberViewController") as! phoneNumberViewController
        presentPanModal(vc)
    }
    
  

}
