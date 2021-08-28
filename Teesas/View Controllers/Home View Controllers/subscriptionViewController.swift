//
//  subscriptionViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 17/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class subscriptionViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension subscriptionViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subscriptionListTableViewCell") as! subscriptionListTableViewCell
        cell.selectBtn.addTarget(self, action: #selector(self.selectCell(_:)), for: .touchUpInside)
        return cell
    }
    @objc func selectCell(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "subscriptionDetailViewController") as! subscriptionDetailViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
}
