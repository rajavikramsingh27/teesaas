//
//  HomeViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        NotificationCenter.default.addObserver(self, selector: #selector(self.pushFromHome(_:)), name: NSNotification.Name("pushFromHome"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    @objc func removeObserversThis(_ sender:NSNotification){
        NotificationCenter.default.removeObserver(self)
    }
   
    @objc func pushFromHome(_ sender:NSNotification){
        let object = sender.object as! String
        let vc = (self.storyboard?.instantiateViewController(withIdentifier: object))!
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewGrowthBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "reportsViewController") as! reportsViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func viewProfile(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "profileViewController") as! profileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension HomeViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeCateogeryTblCell") as! homeCateogeryTblCell
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            cell.collView.reloadData()
            cell.collHeight.constant = cell.collView.collectionViewLayout.collectionViewContentSize.height
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "learningPicksTblCell") as! learningPicksTblCell
            cell.collViewPicks.reloadData()
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "HomeCellTbl") as! HomeCellTbl
            cell.buttonSelect.tag = indexPath.row
            cell.buttonSelect.addTarget(self, action: #selector(selectTeesasPlace(_:)), for: .touchUpInside)
            cell.imgView.image = indexPath.row == 2 ? #imageLiteral(resourceName: "Union 86.png") : #imageLiteral(resourceName: "shareApp-1.png")
            cell.titleLbl.text = indexPath.row == 2 ? "Teesas Place" : "Share with friends"
            return cell
        }
    }
    
    @objc func selectTeesasPlace(_ sender:UIButton){
        if sender.tag == 2{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "teesasPlaceViewController") as! teesasPlaceViewController
                   self.navigationController?.pushViewController(vc, animated: true)
        }else if sender.tag == 3{
            let shareText = "Preparing for exams is so much more interesting with the Teesas app.  Personalized learning helped me master my fundamentals. Download now for free and learn from best teachers!"
            let textToShare = [ shareText ]
            let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
        }
    }
    
}
