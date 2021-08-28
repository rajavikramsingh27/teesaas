//
//  liveChatViewController.swift
//  Teesas
//
//  Created by Ayush Pathak on 18/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit
import MobileCoreServices

class liveChatViewController: UIViewController , UINavigationControllerDelegate, UIImagePickerControllerDelegate{
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var postLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var exitChatPopup: UIView!
    @IBOutlet weak var cancelPopup: UIButton!
    @IBOutlet weak var continuePopup: UIButton!
    @IBOutlet weak var sendBtn: UIButton!
    @IBOutlet weak var messageTf: UITextField!
    @IBOutlet weak var selectFileView: UIView!
    
    //  MARK:  types: - 1 text,2 image, 3 file
    var arrType = ["1","2","3","1","2","3","1","2","3","1","2","3"]
    var messageFromMe = [false,true,false,true,false,true,false,true,false,true,false,true]
    var imagePicker = UIImagePickerController()
    
    var textInputs = [
        "hello",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "hello",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem Lorem ",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.scrollToRow(at: IndexPath(row: messageFromMe.count-1, section: 0), at: .bottom, animated: true)
        self.exitChatPopup.alpha = 0.0
        cancelPopup.roundCorners(corners: [.bottomLeft], radius: 26.0)
        continuePopup.roundCorners(corners: [.bottomRight], radius: 26.0)
        selectFileView.alpha = 0.0
    }
    @IBAction func textfieldMessage(_ sender: UITextField) {
        if sender.text!.trimmingCharacters(in: .whitespacesAndNewlines).count == 0{
            sendBtn.setImage(#imageLiteral(resourceName: "sendDisabled.png"), for: .normal)
        }else{
            sendBtn.setImage(#imageLiteral(resourceName: "sendEnabled.png"), for: .normal)
        }
    }
    
    @IBAction func dislikeBtn(_ sender: Any) {
        
    }
    
    @IBAction func likeBtn(_ sender: Any) {
        
    }
    
    @IBAction func selectFile(_ sender:Any){
        UIView.animate(withDuration: 0.25) {
            self.selectFileView.alpha = 1.0
        }
    }
    
    @IBAction func galaryBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            self.selectFileView.alpha = 0.0
        }) { (_) in
            if UIImagePickerController.isSourceTypeAvailable(.savedPhotosAlbum){
                print("Button capture")
                
                self.imagePicker.delegate = self
                self.imagePicker.sourceType = .savedPhotosAlbum
                self.imagePicker.allowsEditing = false
                
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        
    }
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismiss(animated: true, completion: { () -> Void in
            
        })
        
        //           imageView.image = image
    }
    
    @IBAction func selectDocument(_ sender: UIButton) {
        UIView.animate(withDuration: 0.25, animations: {
            self.selectFileView.alpha = 0.0
        }) { (_) in
            let importMenu = UIDocumentMenuViewController(documentTypes: [String(kUTTypePDF)], in: .import)
            importMenu.delegate = self
            importMenu.modalPresentationStyle = .formSheet
            self.present(importMenu, animated: true, completion: nil)
        }
    }
    @IBAction func cancelSelectFile(_ sender:Any){
        UIView.animate(withDuration: 0.25) {
            self.selectFileView.alpha = 0.0
        }
    }
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelChat(_ sender: Any) {
        UIView.animate(withDuration: 0.25) {
            self.exitChatPopup.alpha = 1.0
        }
    }
    
    @IBAction func cancelPopupBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.25) {
            self.exitChatPopup.alpha = 0.0
        }
    }
    
    @IBAction func continuePopupBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.25, animations: {
            self.exitChatPopup.alpha = 0.0
        }) { (_) in
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func sendMessage(_ sender: UIButton) {
        if sender.image(for: .normal) == #imageLiteral(resourceName: "sendDisabled.png"){
            
        }else{
            //            send message
            self.messageTf.text = ""
        }
    }
    
}
extension liveChatViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrType.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if arrType[indexPath.row] == "1"{
            let font = UIFont(name: "Montserrat-Medium", size: 14.0)!
            let height = heightForView(text: self.textInputs[indexPath.row], font: font, width: self.view.frame.width - 32) + 75
            return (height < 85.0) ? 85.0 : height
        }else if arrType[indexPath.row] == "2"{
            return 230
        }else{
            return 89
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if messageFromMe[indexPath.row]{
            if arrType[indexPath.row] == "1"{
                let cell = tableView.dequeueReusableCell(withIdentifier: "chatMessageCell") as! chatMessageCell
                cell.messageLbl.text = self.textInputs[indexPath.row]
                cell.messageLbl.textColor = UIColor.white
                cell.messageLbl.backgroundColor = hexStringToUIColor(hex: "#449603")
                cell.backView.semanticContentAttribute = .forceLeftToRight
                cell.messageLbl.textAlignment = .justified
                return cell
            }else if arrType[indexPath.row] == "2"{
                let cell = tableView.dequeueReusableCell(withIdentifier: "chatImageCell") as! chatImageCell
                cell.selectBtn.tag = indexPath.row
                
                cell.selectBtn.addTarget(self, action: #selector(self.selectImageCell(_:)), for: .touchUpInside)
                cell.backView.backgroundColor = hexStringToUIColor(hex: "#449603")
                
                cell.viewContainer.semanticContentAttribute = .forceLeftToRight
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "fileChatCell") as! fileChatCell
                cell.viewContainer.semanticContentAttribute = .forceLeftToRight
                cell.fileSelectBtn.tag = indexPath.row
                cell.fileNameLbl.textColor = UIColor.white
                cell.fileSelectBtn.addTarget(self, action: #selector(self.selectFileBtn(_:)), for: .touchUpInside)
                cell.backView.backgroundColor = hexStringToUIColor(hex: "#449603")
                cell.fileNameLbl.textAlignment = .center
                return cell
            }
        }else{
            if arrType[indexPath.row] == "1"{
                let cell = tableView.dequeueReusableCell(withIdentifier: "chatMessageCell") as! chatMessageCell
                cell.messageLbl.textColor = UIColor.black
                cell.messageLbl.text = self.textInputs[indexPath.row]
                cell.messageLbl.backgroundColor = hexStringToUIColor(hex: "#F5F5F5")
                cell.backView.semanticContentAttribute = .forceRightToLeft
                cell.messageLbl.textAlignment = .justified
                return cell
            }else if arrType[indexPath.row] == "2"{
                let cell = tableView.dequeueReusableCell(withIdentifier: "chatImageCell") as! chatImageCell
                cell.selectBtn.tag = indexPath.row
                cell.selectBtn.addTarget(self, action: #selector(self.selectImageCell(_:)), for: .touchUpInside)
                cell.viewContainer.semanticContentAttribute = .forceRightToLeft
                cell.backView.backgroundColor = hexStringToUIColor(hex: "#F5F5F5")
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "fileChatCell") as! fileChatCell
                cell.viewContainer.semanticContentAttribute = .forceRightToLeft
                cell.fileSelectBtn.tag = indexPath.row
                cell.fileNameLbl.textColor = UIColor.black
                cell.fileSelectBtn.addTarget(self, action: #selector(self.selectFileBtn(_:)), for: .touchUpInside)
                cell.backView.backgroundColor = hexStringToUIColor(hex: "#F5F5F5")
                cell.fileNameLbl.textAlignment = .center
                return cell
            }
        }
    }
    @objc func selectFileBtn(_ sender:UIButton){
        
    }
    
    @objc func selectImageCell(_ sender:UIButton){
        
    }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()
        return label.frame.height
    }
}
extension liveChatViewController:UIDocumentMenuDelegate,UIDocumentPickerDelegate
{
    public func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let myURL = urls.first else {
            return
        }
        print("import result : \(myURL)")
    }
    
    
    public func documentMenu(_ documentMenu:UIDocumentMenuViewController, didPickDocumentPicker documentPicker: UIDocumentPickerViewController) {
        documentPicker.delegate = self
        present(documentPicker, animated: true, completion: nil)
    }
    
    
    func documentPickerWasCancelled(_ controller: UIDocumentPickerViewController) {
        print("view was cancelled")
        dismiss(animated: true, completion: nil)
    }
}
