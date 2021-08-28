//
//  homeCateogeryTblCell.swift
//  Teesas
//
//  Created by Ayush Pathak on 04/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class homeCateogeryTblCell: UITableViewCell {

    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var collHeight: NSLayoutConstraint!

    var collViewOneItems = ["Mathematics","Physics","Chemistry","Biology","Exam Mocks","Previous Years Papers"]
    var imgBack : [UIImage] = [#imageLiteral(resourceName: "Group 11627.png"),#imageLiteral(resourceName: "Group 11626.png"),#imageLiteral(resourceName: "Group 11627.png"),#imageLiteral(resourceName: "Group 11626.png"),#imageLiteral(resourceName: "Group 11627.png"),#imageLiteral(resourceName: "Group 11626.png")]
    let imgUp : [UIImage] = [#imageLiteral(resourceName: "Group 11619.png"),#imageLiteral(resourceName: "Group 11623.png"),#imageLiteral(resourceName: "Group 11619.png"),#imageLiteral(resourceName: "Group 11623.png"),#imageLiteral(resourceName: "Group 11619.png"),#imageLiteral(resourceName: "Group 11623.png")]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collView.delegate = self
        self.collView.dataSource = self
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension homeCateogeryTblCell:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (((collectionView.frame.width / 2) / 100) * 66.66) + 10
        return CGSize(width: (collectionView.frame.width / 2) , height: height)
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collViewOneItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "homeCateogeryCell", for: indexPath) as! homeCateogeryCell
        cell.catogeryTitleLbl.text = collViewOneItems[indexPath.row]
        cell.catogeryImageView.image = self.imgUp[indexPath.row]
        cell.backgroundImageView.image = self.imgBack[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.collViewOneItems[indexPath.row] == "Exam Mocks"{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushFromHome"), object: "examMocksViewController")

        }else{
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "pushFromHome"), object: "SubjectsViewController")

        }
    }
    
}
