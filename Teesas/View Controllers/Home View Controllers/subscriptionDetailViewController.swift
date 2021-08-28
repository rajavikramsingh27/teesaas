//
//  subscriptionDetailViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class subscriptionDetailViewController: UIViewController {

    @IBOutlet weak var descriptionHeight: NSLayoutConstraint!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var lblCourseTitle: UILabel!
    @IBOutlet weak var coursePriceLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var deliveryTimeLbl: UILabel!
    @IBOutlet weak var notesLbl: UILabel!
    
    @IBOutlet weak var viewBack: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.descriptionHeight.constant = heightForView(text: self.descriptionLbl.text!, font: UIFont(name: "Montserrat", size: 14.0)!, width: self.view.frame.width-32) + 50
        self.viewBack.frame = CGRect(x: 0, y: 0, width: self.viewBack.frame.width, height: self.viewBack.frame.height+self.descriptionHeight.constant)
        self.tableView.reloadData()
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func subscribeBtn(_ sender: custom_button) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "contactInfoViewController") as! contactInfoViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }


}
