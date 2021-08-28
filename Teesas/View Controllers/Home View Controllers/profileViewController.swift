//
//  profileViewController.swift
//  Teesas
//
//  Created by Appentus Technologies on 3/7/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class profileViewController: UIViewController {

    @IBOutlet weak var viewPopup: UIView!
    @IBOutlet weak var imageUser: UIImageView!
    @IBOutlet weak var collView: UICollectionView!
    @IBOutlet weak var heightCollView: NSLayoutConstraint!


    let arrImagesAvtar = ["Group 116611.png","Group 116621.png","Group 116631.png","Group 116641.png","Group 116651.png","Group 116661.png","Group 116671.png","Group 116681.png","Group 116691.png","Group 116701.png","Group 116711.png","Group 116721.png"]
    
    var arrSelectAvtar = [Bool]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewPopup.alpha = 0.0
        for _ in 0..<self.arrImagesAvtar.count{
            self.arrSelectAvtar.append(false)
        }
        self.arrSelectAvtar[0] = true
        self.imageUser.image = UIImage(named: arrImagesAvtar[0])
    }
   
    @IBAction func editPhotoBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            self.viewPopup.alpha = 1.0
        }
    }
    @IBAction func editProfileBtn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "editProfileViewController") as! editProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func okAvtarPopupBtn(_ sender: custom_button) {
        let index = self.arrSelectAvtar.firstIndex(of: true)
        self.imageUser.image = UIImage(named: self.arrImagesAvtar[index!])
        UIView.animate(withDuration: 0.3) {
            self.viewPopup.alpha = 0.0
        }
    }
    
    @IBAction func selectCourse(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "changeCourseViewController") as! changeCourseViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func back(_ sender : UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
extension profileViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrImagesAvtar.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avtarCollectionViewCell", for: indexPath) as! avtarCollectionViewCell
        cell.userImage.image = UIImage(named: self.arrImagesAvtar[indexPath.row])
        cell.selectedImage.alpha = self.arrSelectAvtar[indexPath.row] == true ? 1.0 : 0.0
        self.heightCollView.constant = collectionView.contentSize.height
        self.view.layoutIfNeeded()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width / 3) - 15, height: (collectionView.frame.width / 3) - 15)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        for i in 0..<self.arrSelectAvtar.count{
            self.arrSelectAvtar[i] = false
        }
        self.arrSelectAvtar[indexPath.row] = true
        self.collView.reloadData()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
