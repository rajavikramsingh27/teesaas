//
//  MoreViewController.swift
//  Teesas
//
//  Created by Appentus Technologies on 3/7/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class MoreViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cancelBtnPopup: UIButton!
    @IBOutlet weak var continueBtnPopup: UIButton!
    @IBOutlet weak var viewSubscription: UIView!
    @IBOutlet weak var errorSubscriptionPopupLbl: UILabel!
    
    @IBOutlet weak var signOutView: UIView!
    @IBOutlet weak var cancelSignout: UIButton!
    @IBOutlet weak var continueSignout: UIButton!
    
    var imagesOptionArr : [UIImage] = [#imageLiteral(resourceName: "parentConnect-1.png"),#imageLiteral(resourceName: "subscription-1.png"),#imageLiteral(resourceName: "redeemVoucher-1.png"),#imageLiteral(resourceName: "shareApp-1.png"),#imageLiteral(resourceName: "contactUs-1.png"),#imageLiteral(resourceName: "terms&conditions-1.png"),#imageLiteral(resourceName: "signout-1.png")]
    var optionTitleArrr = ["Parent Connect","Subscription","Redeem Voucher","Share The App","Contact Us","Terms and Conditions","Sign out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cancelBtnPopup.roundCorners(corners: [.bottomLeft], radius: 26.0)
        continueBtnPopup.roundCorners(corners: [.bottomRight], radius: 26.0)
        cancelSignout.roundCorners(corners: [.bottomLeft], radius: 26.0)
        continueSignout.roundCorners(corners: [.bottomRight], radius: 26.0)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.viewSubscription.alpha = 0.0
        self.signOutView.alpha = 0.0
        errorSubscriptionPopupLbl.alpha = 0.0
    }
    @IBAction func canclPopupBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25) {
            self.viewSubscription.alpha = 0.0
        }
    }
    @IBAction func continuePopupBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25) {
            self.viewSubscription.alpha = 0.0
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "voucherReddemedViewController") as! voucherReddemedViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func cancelSignout(_ sender: Any) {
        UIView.animate(withDuration: 0.25) {
            self.signOutView.alpha = 0.0
        }
    }
    
    @IBAction func continueSignout(_ sender: Any) {
        UIView.animate(withDuration: 0.25) {
            self.signOutView.alpha = 0.0
        }
        NotificationCenter.default.post(name: NSNotification.Name("removeAllObservers"), object: nil)
        let vc = UIStoryboard(name: "Auth", bundle: nil).instantiateViewController(withIdentifier: "loginViewController") as! loginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension MoreViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "moreTableviewCell") as! moreTableviewCell
        cell.imageOptionView.image = imagesOptionArr[indexPath.row]
        cell.titleLbl.text = optionTitleArrr[indexPath.row]
        cell.selectButton.addTarget(self, action: #selector(self.selectedCellAction(_:)), for: .touchUpInside)
        cell.selectButton.tag = indexPath.row
        return cell
    }
    @objc func selectedCellAction(_ sender:UIButton){
        
        if sender.tag == 0{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "parentsConnectViewController") as! parentsConnectViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 1{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "subscriptionViewController") as! subscriptionViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 2{
            UIView.animate(withDuration: 0.25) {
                self.viewSubscription.alpha = 1.0
            }
        }else if sender.tag == 3{
            let shareText = "Preparing for exams is so much more interesting with the Teesas app.  Personalized learning helped me master my fundamentals. Download now for free and learn from best teachers!"
            let textToShare = [ shareText ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }else if sender.tag == 4{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "contactUsViewController") as! contactUsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        }else if sender.tag == 5{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "termsAndConditionsViewController") as! termsAndConditionsViewController
            self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 6{
            UIView.animate(withDuration: 0.25) {
                self.signOutView.alpha = 1.0
            }
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
}
