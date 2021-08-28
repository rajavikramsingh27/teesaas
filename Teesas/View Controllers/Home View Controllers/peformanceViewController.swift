//
//  peformanceViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 05/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import CSPieChart
import KDCircularProgress

class peformanceViewController: UIViewController {
    
    
//    MARK:- Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    //    MARK:- view for overall subjects

    @IBOutlet weak var subjectsCollectionView: UICollectionView!
    @IBOutlet weak var piechartAll: CSPieChart!
    @IBOutlet weak var viewOnChart: UIView!
    @IBOutlet weak var otherChartView: UIView!
    
//    MARK:- view for other subjects
    
    @IBOutlet weak var chartTwoView: GradientView!
    @IBOutlet weak var subjectNameLbl: UILabel!
    @IBOutlet weak var progressView: KDCircularProgress!
    
    var selectedSubject = [Bool]()
    var dataList = [
           CSPieChartData(key: "test1", value: 25),
           CSPieChartData(key: "test2", value: 25),
           CSPieChartData(key: "test3", value: 25),
           CSPieChartData(key: "test4", value: 25),
       ]
       
       var colorList: [UIColor] = [
           hexStringToUIColor(hex: "#009EF5"),
           hexStringToUIColor(hex: "#FF782E"),
           hexStringToUIColor(hex: "#43B841"),
           hexStringToUIColor(hex: "#AA20A0")
       ]
    var percentageArrChart = ["0%\n","0%\n","0%\n","0%\n"]
    var titleArrChart = ["Mathematics","Physics","Biology","Chemistry"]
       
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0..<7{
            self.selectedSubject.append(false)
        }
        self.selectedSubject[0] = true
        piechartAll.dataSource = self
        piechartAll.delegate = self
    
        piechartAll.pieChartRadiusRate = 0.8
        piechartAll.pieChartLineLength = 5
        piechartAll.seletingAnimationType = .touch
        viewOnChart.layer.masksToBounds = true
        viewOnChart.layer.cornerRadius = viewOnChart.frame.height/2
        piechartAll.show(animated: true)
        otherChartView.alpha = 0.0
        chartTwoView.layer.masksToBounds = true
        chartTwoView.layer.cornerRadius = chartTwoView.frame.height / 2
        
        
    }
    
    @IBAction func startTestBtn(_ sender: custom_button) {
        if selectedSubject[0]{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "bottomSubjectSheetViewController") as! bottomSubjectSheetViewController
            presentPanModal(vc)
        }else{
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "SubjectsViewController") as! SubjectsViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}

extension peformanceViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
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

        otherChartView.alpha = indexPath.row != 0 ? 1.0 : 0.0

        self.subjectsCollectionView.reloadData()
        self.progressView.animate(fromAngle: 0, toAngle: 360, duration: 1.0) { completed in
            if completed {
                print("animation stopped, completed")
            } else {
                print("animation stopped, was interrupted")
            }
        }
    }
    func width(withConstrainedHeight height: CGFloat, font: UIFont,str:String) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = str.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
    
    
    
}
extension peformanceViewController: CSPieChartDataSource {
    
    func numberOfComponentData() -> Int {
        return dataList.count
    }
    
    func pieChart(_ pieChart: CSPieChart, dataForComponentAt index: Int) -> CSPieChartData {
        return dataList[index]
    }
    
    func numberOfComponentColors() -> Int {
        return colorList.count
    }
    
    func pieChart(_ pieChart: CSPieChart, colorForComponentAt index: Int) -> UIColor {
        return colorList[index]
    }
    
    func numberOfLineColors() -> Int {
        return colorList.count
    }
    
    func pieChart(_ pieChart: CSPieChart, lineColorForComponentAt index: Int) -> UIColor {
        return colorList[index]
    }
    
    func numberOfComponentSubViews() -> Int {
        return dataList.count
    }
    
    func pieChart(_ pieChart: CSPieChart, viewForComponentAt index: Int) -> UIView {
        let view = UILabel(frame: CGRect(x: 0, y: 0, width: 90, height: 45))
        let font = UIFont(name: "Montserrat-Medium", size: 12.0)!
        let font2 = UIFont(name: "Montserrat-Bold", size: 20.0)!

        view.numberOfLines = 3
        
        let boldFontAttributes = [NSAttributedString.Key.foregroundColor: colorList[index],
        NSAttributedString.Key.font: font2]
        let normalFontAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
        NSAttributedString.Key.font: font]
        let partOne = NSMutableAttributedString(string: percentageArrChart[index], attributes: boldFontAttributes)
        let partTwo = NSMutableAttributedString(string: titleArrChart[index], attributes: normalFontAttributes)

        let combination = NSMutableAttributedString()

        combination.append(partOne)
        combination.append(partTwo)
        view.attributedText = combination
        view.textAlignment = .center

        return view
    }
}

extension peformanceViewController: CSPieChartDelegate {
    
    func pieChart(_ pieChart: CSPieChart, didSelectComponentAt index: Int) {
        let data = dataList[index]
        print(data.key)
    }
}
extension peformanceViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "performanceSkillCell") as! performanceSkillCell
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            cell.collView.reloadData()
            cell.skillCollectionHeight.constant = cell.collView.collectionViewLayout.collectionViewContentSize.height
            return cell
        }else if indexPath.row == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "keyFocusCell") as! keyFocusCell
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            cell.collView.reloadData()
            cell.collViewHeight.constant = cell.collView.collectionViewLayout.collectionViewContentSize.height
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "recentTestCell") as! recentTestCell
            cell.frame = tableView.bounds
            cell.layoutIfNeeded()
            cell.collView.reloadData()
            cell.collHeight.constant = cell.collView.collectionViewLayout.collectionViewContentSize.height
            return cell
        }
    }
}
