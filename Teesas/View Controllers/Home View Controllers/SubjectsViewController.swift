//
//  SubjectsViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 06/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class SubjectsViewController: UIViewController {

    @IBOutlet weak var widthBottomSelectedView: NSLayoutConstraint!
    @IBOutlet weak var performanceImage: UIImageView!
    @IBOutlet weak var performanceLbl: UILabel!
    @IBOutlet weak var growthImage: UIImageView!
    @IBOutlet weak var growthLbl: UILabel!
    @IBOutlet weak var bottomSelectedViewPerformance: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setSelectedReportType(with: ReportType.Performance)
        NotificationCenter.default.addObserver(self, selector: #selector(self.get_offset_set_view(_:)), name: Notification.Name("get_offset_set_view_subject"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    @objc func removeObserversThis(_ sender:NSNotification){
           NotificationCenter.default.removeObserver(self)
       }
      
    
    func setSelectedReportType(with Type: ReportType) {
        self.widthBottomSelectedView.constant = (UIScreen.main.bounds.width / 2 ) - 50
        self.performanceImage.image = (Type == ReportType.Performance) ? #imageLiteral(resourceName: "indivisualSelected.png") : #imageLiteral(resourceName: "indivisualUnselected.png")
        self.performanceLbl.textColor = (Type == ReportType.Performance) ? UIColor.white.withAlphaComponent(1.0) : UIColor.white.withAlphaComponent(0.74)
        self.growthImage.image = (Type == ReportType.Performance) ? #imageLiteral(resourceName: "libraryUnselected.png") : #imageLiteral(resourceName: "librarySelected.png")
        self.growthLbl.textColor = (Type == ReportType.Performance) ? UIColor.white.withAlphaComponent(0.74) : UIColor.white.withAlphaComponent(1.0)
        UIView.animate(withDuration: 0.10) {
            self.bottomSelectedViewPerformance.frame.origin.x = (Type == ReportType.Performance) ? 25 : ((UIScreen.main.bounds.width/2)+25)
        }
    }
    
    @objc func get_offset_set_view(_ sender:NSNotification){
        let object = sender.object as! Int
        setSelectedReportType(with: (object == 0) ? ReportType.Performance : ReportType.Growth)
    }
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectReportTypeBtn(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("move_by_buttons_subject"), object: sender.tag)
        setSelectedReportType(with: (sender.tag == 0) ? ReportType.Performance : ReportType.Growth)
    }
    
    

}
extension SubjectsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "indivisualSubjectCell") as! indivisualSubjectCell
        cell.collView.reloadData()
        return cell
    }
    
}
