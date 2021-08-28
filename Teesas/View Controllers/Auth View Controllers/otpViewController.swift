//
//  otpViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import SVPinView

class otpViewController: UIViewController {

    @IBOutlet weak var pinView: SVPinView!
    
    var isFromForgotPass = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPinView()

    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setupPinView() {
        pinView.pinLength = 4
        pinView.activeBorderLineThickness = 1
        pinView.borderLineThickness = 1
        pinView.borderLineColor = hexStringToUIColor(hex: "#AFAFAF")
        pinView.activeBorderLineColor = hexStringToUIColor(hex: "#AFAFAF")
        pinView.activeBorderLineThickness = 1
        pinView.activeFieldCornerRadius = 12
        pinView.interSpace = 16
        pinView.fieldBackgroundColor = UIColor.clear
        pinView.activeFieldBackgroundColor = UIColor.clear
        pinView.fieldCornerRadius = 12
        pinView.activeFieldCornerRadius = 0
        pinView.style = .box
        pinView.shouldSecureText = false
        pinView.becomeFirstResponder()
        pinView.didFinishCallback = { pin in
            print("The pin entered is \(pin)")
            if self.isFromForgotPass{
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "createNewPassViewController") as! createNewPassViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }else{
                let vc = UIStoryboard(name: "Home", bundle: nil).instantiateViewController(withIdentifier: "tabbar")
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
    }
    
   

}

