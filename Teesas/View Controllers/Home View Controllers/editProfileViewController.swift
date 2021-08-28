
//
//  editProfileViewController.swift
//  Teesas
//
//  Created by Appentus Technologies on 3/7/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class editProfileViewController: UIViewController {

    @IBOutlet weak var birthdayBtn: UIButton!
    @IBOutlet weak var viewDateSelect: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var genderViewHeight: NSLayoutConstraint!
    @IBOutlet weak var genderBtn: UIButton!
    @IBOutlet weak var genderStackView: UIStackView!
    @IBOutlet weak var heightGenderStackView: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDateSelect.alpha = 0.0
        datePicker.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        datePicker.setDate(Date(), animated: true)
        self.genderViewHeight.constant = 51.0
        self.genderStackView.alpha = 0.0
        self.heightGenderStackView.constant = 0.0
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            print("\(day) \(month) \(year)")
        }
        let date = sender.date
        let df = DateFormatter()
        df.dateFormat = "dd MMM yyyy"
        self.birthdayBtn.setTitle(df.string(from: date), for: .normal)
    }
    
    @IBAction func selectGender(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25) {
            self.genderViewHeight.constant = 155.0
            self.genderStackView.alpha = 1.0
            self.heightGenderStackView.constant = 92.0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func genderOptionsSelectedBtn(_ sender: UIButton) {
        self.genderBtn.setTitle(sender.title(for: .normal), for: .normal)
        UIView.animate(withDuration: 0.25) {
            self.genderViewHeight.constant = 51.0
            self.genderStackView.alpha = 0.0
            self.heightGenderStackView.constant = 0.0
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func saveBtnPopupDate(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.viewDateSelect.alpha = 0.0
        }
    }
    @IBAction func okSelectDateBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.3) {
            self.viewDateSelect.alpha = 0.0
        }
    }
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func dobBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.viewDateSelect.alpha = 1.0
        }
    }
    
    
}
