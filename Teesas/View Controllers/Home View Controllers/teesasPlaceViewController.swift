//
//  teesasPlaceViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 16/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class teesasPlaceViewController: UIViewController {

    @IBOutlet weak var viewBottomLeading: NSLayoutConstraint!
    @IBOutlet weak var viewBottom: UIView!
    @IBOutlet var topButtons: [UILabel]!
    @IBOutlet weak var viewTopOne: UIView!
    @IBOutlet weak var widthPerfom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setSelectedReportType(1)
        NotificationCenter.default.addObserver(self, selector: #selector(self.get_offset_set_view(_:)), name: Notification.Name("get_offset_set_viewPlace"), object: nil)
        widthPerfom.constant = viewTopOne.frame.width
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    @objc func removeObserversThis(_ sender:NSNotification){
           NotificationCenter.default.removeObserver(self)
       }
      
    @IBAction func btnSelectCatogery(_ sender: UIButton) {
        NotificationCenter.default.post(name: NSNotification.Name("move_by_buttonsPlace"), object: sender.tag)
        setSelectedReportType(sender.tag)
        
    }
    
    @objc func get_offset_set_view(_ sender:NSNotification){
        let object = sender.object as! Int
        setSelectedReportType(object+1)
    }
 
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
 
    func setSelectedReportType(_ index:Int) {
        let originNext = (UIScreen.main.bounds.width / 4) * CGFloat((index-1))
        UIView.animate(withDuration: 0.10) {
            self.viewBottom.frame.origin.x = originNext
            
        }
        for i in 0..<topButtons.count{
            topButtons[i].textColor = (i != (index-1)) ? UIColor.white.withAlphaComponent(0.75) : UIColor.white
        }
    }
    
    
}
