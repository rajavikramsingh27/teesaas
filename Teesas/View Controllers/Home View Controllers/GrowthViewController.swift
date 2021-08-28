//
//  GrowthViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 05/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import HCLineChartView
import PanModal

class GrowthViewController: UIViewController {
   
    @IBOutlet weak var chartView: HCLineChartView!
    @IBOutlet weak var collView: UICollectionView!
    
    var selectedSubject = [Bool]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLineChart()
        for _ in 0..<7{
            self.selectedSubject.append(false)
        }
        self.selectedSubject[0] = true
    }
    
    func setLineChart() {
        self.chartView.xElements = [10,11,12,13,14,15,16]
        self.chartView.yElements = [00,25,35,75,100]
        self.chartView.drawChart()
    }
    
    @IBAction func startLeaning(_ sender: custom_button) {
        
        if selectedSubject[0]{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "bottomSubjectSheetViewController") as! bottomSubjectSheetViewController
            presentPanModal(vc)
        }else{
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SubjectsViewController") as! SubjectsViewController
            self.navigationController?.pushViewController(vc, animated: true)

        }
    }
    
}
extension GrowthViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "subjectCell", for: indexPath) as! subjectCell
        if !self.selectedSubject[indexPath.row]{
            cell.gradView.startColor = UIColor.white
            cell.gradView.endColor = UIColor.white
            cell.imgView.image = #imageLiteral(resourceName: "allReportsFaded.png")
            cell.layer.borderColor = hexStringToUIColor(hex: "#B8B8B8").cgColor
            cell.layer.borderWidth = 1.0
            cell.titleLbl.textColor = hexStringToUIColor(hex: "#B8B8B8")
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 20
        }else{
            cell.gradView.startColor = hexStringToUIColor(hex: "#61B5FF")
            cell.gradView.endColor = hexStringToUIColor(hex: "#4E66E2")
            cell.imgView.image = #imageLiteral(resourceName: "allReports-1.png")
            cell.layer.borderWidth = 0.0
            
            cell.titleLbl.textColor = hexStringToUIColor(hex: "#FFFFFF")
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "Montserrat-Medium", size: 14.0)!
        let widthFinal = width(withConstrainedHeight: 40, font: font, str: "All Reports") + 120
        return CGSize(width: widthFinal, height: 40)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<selectedSubject.count{
            self.selectedSubject[i] = false
        }
        self.selectedSubject[indexPath.row] = true
        self.collView.reloadData()
        self.chartView.drawChart()
    }
    func width(withConstrainedHeight height: CGFloat, font: UIFont,str:String) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = str.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    
    
}
extension GrowthViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recentGrowthReportCell") as! recentGrowthReportCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
