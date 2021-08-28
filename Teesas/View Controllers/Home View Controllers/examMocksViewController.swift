//
//  examMocksViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 16/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class examMocksViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func back(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension examMocksViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 15
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MockExamsCell") as! MockExamsCell
        cell.selectBtn.tag = indexPath.row
        cell.selectBtn.addTarget(self, action: #selector(self.selectBtn(_:)), for: .touchUpInside)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 163
    }
    @objc func selectBtn(_ sender:UIButton){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "testListViewController") as! testListViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
