//
//  changeCourseCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 16/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class changeCourseCell: UITableViewCell {

    @IBOutlet weak var titleCourseCatogery: UILabel!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var heightCollectionView: NSLayoutConstraint!
    
    var itemsInCollection = [String]()
    var selctedIndex = 0
    var allArr = [[Bool]]()
    
    var arrSelectedLast = [[Bool]]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collView.delegate = self
        collView.dataSource = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension changeCourseCell: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return itemsInCollection.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "changeCourseCollectionViewCell", for: indexPath) as! changeCourseCollectionViewCell
        cell.layer.shouldRasterize = true
        cell.layer.rasterizationScale = UIScreen.main.scale
        cell.btnType.setTitle(itemsInCollection[indexPath.item], for: .normal)
        cell.btnType.addTarget(self, action: #selector(selectCell(_:)), for: .touchUpInside)
        cell.btnType.tag = indexPath.row
        cell.imagePreviousSelected.isHidden = !self.arrSelectedLast[selctedIndex][indexPath.row]
        if allArr[selctedIndex][indexPath.row]{
            cell.btnType.backgroundColor = UIColor(red: 68.0/255.0, green: 150.0/255.0, blue: 3.0/255.0, alpha: 1.0)
            cell.btnType.setTitleColor(UIColor.white, for: .normal)
            cell.btnType.colot = UIColor.clear
        }else{
            cell.btnType.backgroundColor = UIColor.white
            cell.btnType.setTitleColor(UIColor(red: 68.0/255.0, green: 150.0/255.0, blue: 3.0/255.0, alpha: 1.0), for: .normal)
            cell.btnType.colot = UIColor(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)

        }
        return cell
    }
    
    
    @objc func selectCell(_ sender:UIButton){
        for i in 0..<self.allArr.count{
            for j in 0..<allArr[i].count{
                self.allArr[i][j] = false
            }
        }
        allArr[selctedIndex][sender.tag] = true
        arrSelectedLast[selctedIndex][sender.tag] = true
        NotificationCenter.default.post(name: NSNotification.Name("reloadTable"), object: selctedIndex,userInfo: ["val":allArr,"selectedOld": arrSelectedLast])
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let font = UIFont(name: "Montserrat-Regular", size: 17.0)!
        let widthFinal = width(withConstrainedHeight: 45, font: font, str: itemsInCollection[indexPath.item]) + 55
        return CGSize(width: widthFinal, height: 55)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func width(withConstrainedHeight height: CGFloat, font: UIFont,str:String) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = str.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        return ceil(boundingBox.width)
    }
}
