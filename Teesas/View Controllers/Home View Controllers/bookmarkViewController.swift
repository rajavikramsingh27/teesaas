//
//  bookmarkViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import KUIPopOver

class bookmarkViewController: UIViewController {

    @IBOutlet weak var subjectCollectionView: UICollectionView!
    @IBOutlet weak var tableView: UITableView!

    var popOverViewController = DefaultPopOverViewController()

    
    var selectedArrSubjects = [true,false,false,false,false,false,false,false,false,false]
    var arrItemsTableTypeIsQuestion = [true,false,true,true,false,false,true,true,false,true]
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(btnFilterActions(_:)), name: NSNotification.Name("selectFilter"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    @objc func removeObserversThis(_ sender:NSNotification){
           NotificationCenter.default.removeObserver(self)
       }
      
    @IBAction func filterBtn(_ sender: custom_button) {
        popOverViewController = DefaultPopOverViewController()
        popOverViewController.preferredContentSize = CGSize(width: 180, height: 170)
        popOverViewController.popoverPresentationController?.sourceView = sender
        let customView = UINib(nibName: "custom_filter_popup", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! custom_filter_popup
        customView.frame.size = CGSize(width: 180, height: 180)
        customView.frame.origin = CGPoint(x: 0, y: 0)
        popOverViewController.view.addSubview(customView)
        popOverViewController.popoverPresentationController?.sourceRect = sender.bounds
        present(popOverViewController, animated: true, completion: nil)
    }
    
    @objc func btnFilterActions(_ sender:NSNotification){
        print("\(sender.object as! Int)")
        dismiss(animated: true, completion: nil)
    }
}
extension bookmarkViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrItemsTableTypeIsQuestion.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return arrItemsTableTypeIsQuestion[indexPath.row] == true ? 125 : 100
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrItemsTableTypeIsQuestion[indexPath.row]{
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkQuestionCell") as! bookmarkQuestionCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkVideoCell") as! bookmarkVideoCell
            return cell
        }
    }
}
extension bookmarkViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return selectedArrSubjects.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bookmarkSubjectCell", for: indexPath) as! bookmarkSubjectCell
//        UIView.animate(withDuration: 0.25) {
            cell.titleLbl.textColor = self.selectedArrSubjects[indexPath.row] == true ? UIColor.black : hexStringToUIColor(hex: "#B8B8B8")
            cell.imageSubject.layer.borderColor = self.selectedArrSubjects[indexPath.row] == true ? UIColor.clear.cgColor : hexStringToUIColor(hex: "#B8B8B8").cgColor
            cell.imageSubject.layer.borderWidth = 1.0
            cell.innerImageView.alpha = self.selectedArrSubjects[indexPath.row] == true ? 0.0 : 1.0
            cell.imageSubject.image =  self.selectedArrSubjects[indexPath.row] == true ? #imageLiteral(resourceName: "selectedBookmarkSubject.png") : nil
            cell.titleLbl.text = indexPath.row == 0 ? "All" : "Physics"
//            self.view.layoutIfNeeded()
////        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "Montserrat-Medium", size: 14.0)!
        let widthFinal = width(withConstrainedHeight: 40, font: font, str: "Physics") + 25
        return CGSize(width: (widthFinal < 70) ? 70 : widthFinal , height: 81)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<selectedArrSubjects.count{
            selectedArrSubjects[i] = false
        }
        selectedArrSubjects[indexPath.row] = true
        self.subjectCollectionView.reloadData()
    }
    func width(withConstrainedHeight height: CGFloat, font: UIFont,str:String) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = str.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    
    
}
