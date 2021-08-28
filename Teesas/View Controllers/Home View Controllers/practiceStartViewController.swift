//
//  practiceStartViewController.swift
//  Teesas

//  Created by Ayush Pathak on 18/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class practiceStartViewController: UIViewController {
  
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var progressSubtitleLbl: UILabel!
    @IBOutlet weak var imgOne: UIImageView!
    @IBOutlet weak var imgTwo: UIImageView!
    @IBOutlet weak var imgThree: UIImageView!
    @IBOutlet weak var imfFour: UIImageView!
    @IBOutlet weak var knowledgeLbl: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    
    @IBOutlet weak var accuracyLbl: UILabel!
    @IBOutlet weak var timeSpentLbl: UILabel!
    @IBOutlet weak var avgTimeLbl: UILabel!
    @IBOutlet weak var questionNumberLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func practiceBtn(_ sender: Any) {
   
    }
    
    @IBAction func viewDetailBtn(_ sender: Any) {
    
    }
    
}
extension practiceStartViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicsPracticedCell") as! topicsPracticedCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
        
    }
}
