//
//  courseSelectViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 03/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class courseSelectViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var courseTitles : [String] = ["Pre School","Pre School","Pre School","Pre School","Pre School","Pre School","Pre School","Pre School"]
    var courseSubItems : [[String]] = [
        ["1st","2nd"],
        ["1st"],
        ["CAT","IAS","GMAT","GRE"],
        ["1st","2nd"],
        ["1st"],
        ["1st","2nd","3rd","4th","5th","6th"],
        ["1st","2nd"],
        ["1st","2nd","3rd","4th","5th","6th"]
    ]
    
    var selctedArr = [
                    [false,false],
                    [false],
                    [false,false,false,false,false,false,false,false,false,],
                    [false,false,],
                    [false,],
                    [false,false,false,false,false,false,],
                    [false,false,],
                    [false,false,false,false,false,false,]
    ]
    
    private var iconsCellHeight: CGFloat = 500

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 40
        tableView.rowHeight = UITableView.automaticDimension
        NotificationCenter.default.addObserver(
        self,
        selector: #selector(self.reloadTable(_:)),
        name: NSNotification.Name(rawValue: "reloadTable"),
        object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    @objc func removeObserversThis(_ sender:NSNotification){
           NotificationCenter.default.removeObserver(self)
       }
      
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func reloadTable(_ sender:NSNotification){
        _ = sender.object as! Int
        let arrsel = sender.userInfo! as NSDictionary
        self.selctedArr = arrsel["val"] as! [[Bool]]
        self.tableView.reloadData()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "registerViewController") as! registerViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension courseSelectViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courseTitles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "courseListCell") as! courseListCell
        cell.titleCourseCatogery.text = courseTitles[indexPath.row]
        cell.itemsInCollection = courseSubItems[indexPath.row]
        cell.allArr = self.selctedArr
        cell.selctedIndex = indexPath.row
        cell.frame = tableView.bounds
        cell.layoutIfNeeded()
        cell.collView.reloadData()
        cell.heightCollectionView.constant = cell.collView.collectionViewLayout.collectionViewContentSize.height
        return cell
    }
    
}
