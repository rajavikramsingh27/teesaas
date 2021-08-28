//
//  registerViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class registerViewController: UIViewController {

    @IBOutlet weak var countryCodeBtn: UIButton!
    @IBOutlet weak var getLocationView: shadow_uiview!
    
    var timer = Timer()
    var alreadyAccount = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocationView.alpha = 0.0

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.countryCodeBtn.setTitle(countryCodeSelected, for: .normal)   
    }

    @IBAction func selectLocationBtn(_ sender: UIButton) {
        self.getLocationView.alpha = 1.0
        timer = Timer.scheduledTimer(timeInterval: 0.7, target: self, selector: #selector(self.alarmAlertActivate), userInfo: nil, repeats: true)
        DispatchQueue.main.asyncAfter(deadline: .now()+5.0) {
            self.timer.invalidate()
            self.getLocationView.alpha = 0.0
        }
    }
    @objc func alarmAlertActivate(){
        UIView.animate(withDuration: 0.4) {
            self.getLocationView.alpha = self.getLocationView.alpha == 1.0 ? 0.0 : 1.0
        }
    }
    
    @IBAction func registerAccBtn(_ sender: custom_button) {
        if alreadyAccount{
            alreadyAccount = false
            self.showCustomAlertWith(message: "It seems like you already have an account. Please login", titleOkBtn: "Login", descMsg: "", itemimage: #imageLiteral(resourceName: "Group 11607.png"), actions: nil)
        }else{
            let privacyVc = self.storyboard?.instantiateViewController(withIdentifier: "otpViewController") as! otpViewController
            privacyVc.isFromForgotPass = false
            self.navigationController?.pushViewController(privacyVc, animated: true)
        }
    }
    
    @IBAction func showPhoneNumberCodeSelect(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "phoneNumberViewController") as! phoneNumberViewController
        presentPanModal(vc)
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func privacyPolicyBtn(_ sender: UIButton) {
        let privacyVc = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionViewController") as! TermsAndConditionViewController
        privacyVc.tilerText = "Privacy Policy"
        self.navigationController?.pushViewController(privacyVc, animated: true)
    }
    
    @IBAction func termsAndConditions(_ sender: UIButton) {
        let termsVc = self.storyboard?.instantiateViewController(withIdentifier: "TermsAndConditionViewController") as! TermsAndConditionViewController
          termsVc.tilerText = "Terms and Conditions"
          self.navigationController?.pushViewController(termsVc, animated: true)
    }
    
    
    
//    self.showCustomAlertWith(
//    message: "Adresse e-mail invalide.",
//    descMsg: "",
//    itemimage: nil,
//    actions: nil)
}

