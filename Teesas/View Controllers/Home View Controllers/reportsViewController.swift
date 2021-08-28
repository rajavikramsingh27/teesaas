//
//  reportsViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 05/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class reportsViewController: UIViewController {

    @IBOutlet weak var performanceImage: UIImageView!
    @IBOutlet weak var performanceLbl: UILabel!
    @IBOutlet weak var growthImage: UIImageView!
    @IBOutlet weak var growthLbl: UILabel!
    @IBOutlet weak var bottomSelectedViewPerformance: UIView!
    @IBOutlet weak var widthBottomSelectedView: NSLayoutConstraint!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSelectedReportType(with: ReportType.Performance)
        NotificationCenter.default.addObserver(self, selector: #selector(self.get_offset_set_view(_:)), name: Notification.Name("get_offset_set_view"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.reportActions(_:)), name: NSNotification.Name("reportActions"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    @objc func removeObserversThis(_ sender:NSNotification){
        NotificationCenter.default.removeObserver(self)
    }

    @objc func reportActions(_ sender:NSNotification){
        let name = sender.object as! String
        let vc = self.storyboard?.instantiateViewController(withIdentifier: name)
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    @objc func get_offset_set_view(_ sender:NSNotification){
        let object = sender.object as! Int
        setSelectedReportType(with: (object == 0) ? ReportType.Performance : ReportType.Growth)
    }

    func setSelectedReportType(with Type: ReportType) {
        self.widthBottomSelectedView.constant = (UIScreen.main.bounds.width / 2 ) - 50
        self.performanceImage.image = (Type == ReportType.Performance) ? #imageLiteral(resourceName: "selectedPerformance.png") : #imageLiteral(resourceName: "unselectedPerformance.png")
        self.performanceLbl.textColor = (Type == ReportType.Performance) ? UIColor.white.withAlphaComponent(1.0) : UIColor.white.withAlphaComponent(0.74)
        self.growthImage.image = (Type == ReportType.Performance) ? #imageLiteral(resourceName: "unselectedGrowth.png") : #imageLiteral(resourceName: "selectedGrowth.png")
        self.growthLbl.textColor = (Type == ReportType.Performance) ? UIColor.white.withAlphaComponent(0.74) : UIColor.white.withAlphaComponent(1.0)
        UIView.animate(withDuration: 0.10) {
            self.bottomSelectedViewPerformance.frame.origin.x = (Type == ReportType.Performance) ? 25 : ((UIScreen.main.bounds.width/2)+25)
        }
    }
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectReportTypeBtn(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("move_by_buttons"), object: sender.tag)
        setSelectedReportType(with: (sender.tag == 0) ? ReportType.Performance : ReportType.Growth)
    }
    
}

enum ReportType{
    case Performance
    case Growth
}
