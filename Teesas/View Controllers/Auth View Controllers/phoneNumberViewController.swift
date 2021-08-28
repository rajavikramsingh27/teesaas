//
//  phoneNumberViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 02/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import PanModal

class phoneNumberViewController: UIViewController {
 
    var countryName = [String]()
    var countryCode = [String]()
    var countryDisplayName = [String]()
    var searchArr = [String]()
    
    @IBOutlet weak var searchTf: DesignableUITextField!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getCountriesWithCode()
        searchArr = countryDisplayName
    }
    
    @IBAction func searchTF(_ sender: UITextField) {
        searchArr = (!(searchTf.text!.count > 0)) ? countryDisplayName : countryDisplayName.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: sender.text!, options: .caseInsensitive) != nil
        })
        
        self.tableView.reloadData()
    }
    
}
extension phoneNumberViewController: PanModalPresentable {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    var panScrollable: UIScrollView? {
        return nil
    }

    var longFormHeight: PanModalHeight {
        return .maxHeightWithTopInset(140)
    }

    var anchorModalToLongForm: Bool {
        return false
    }
}

extension phoneNumberViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCodeCell") as! countryCodeCell
        cell.countryTitleLbl.text = self.searchArr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let indexSelect = countryDisplayName.firstIndex(of: self.searchArr[indexPath.row])
        countryCodeSelected = countryCode[indexSelect!]
        self.dismiss(animated: true, completion: nil)
    }
    
    func getCountriesWithCode() {
          if let path = Bundle.main.path(forResource: "countries", ofType: "json") {
              do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                  if let jsonResult = jsonResult as? NSArray{
                      countryName = [String]()
                      countryCode = [String]()
                      countryDisplayName = [String]()
                      for i in 0..<jsonResult.count{
                          let dict = jsonResult[i] as! NSDictionary
                          countryName.append("\(dict["country_name"]!)")
                          countryCode.append("\(dict["country_isd"]!)")
                          countryDisplayName.append("\(dict["display"]!)")
                      }
                  }
              } catch {
                  // handle error
              }
          }
      }
}
