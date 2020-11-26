//
//  ChatViewController.swift
//  FlashChat
//
//  Created by MAC on 03/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseAuth


class ChatViewController: UIViewController {

    
    
    var messages : [Chat] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FlashChat"
        navigationItem.hidesBackButton = true
        tblview.dataSource = self
        
        tblview.register(UINib(nibName: "MessafegeTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")

    
        loadmessage()
    }
    
    
    func loadmessage(){
        Firestore.firestore().collection("Chat").order(by: "Date").addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            if let e = error {
                print("There was an issue to ritriving data from firebase.\(e)")
            }else{
                if let  snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messagesender = data["Sender"] as? String, let messagebody = data["body"] as? String {
                            let newMesage = Chat(Sender: messagesender, body: messagebody)
                          self.messages.append(newMesage)
                                                          
                            DispatchQueue.main.async {
                                     self.tblview.reloadData()
                                let indexPath = IndexPath(row: self.messages.count-1, section: 0)
                                self.tblview.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
            
        }
    }
    
    
    @IBAction func SignOut(_ sender: UIBarButtonItem) {
   
           
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    
    }
    
    @IBAction func send(_ sender: UIButton) {
        
        if let messageBody = textfield.text, let messageSender = Auth.auth().currentUser?.email {
            Firestore.firestore().collection("Chat").addDocument(data: ["Sender":messageSender, "body": messageBody, "Date": Date().timeIntervalSince1970 ]) { (error) in
                if let e = error{
                    print("there was an issue iin saving data \(e)")
                }else{
                    print("Successfully sava Data.")
                    self.textfield.text = ""	
                }
            }
        }
    }
    @IBOutlet weak var tblview: UITableView!
    @IBOutlet weak var textfield: UITextField!
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MessafegeTableViewCell
       let messagess = messages[indexPath.row]
        cell.label.text = messagess.body
        
        if messagess.Sender == Auth.auth().currentUser?.email {
            cell.avtar.isHidden = true
            cell.LeftBtn.isHidden = false
            cell.messageBubble.backgroundColor = UIColor(named: MySegue.BrandColor.blue)
             cell.label.layer.cornerRadius = 30
            cell.label.textColor = UIColor(named: MySegue.BrandColor.Brandblue)
        }else{
            cell.LeftBtn.isHidden = true
            cell.avtar.isHidden = false
                 cell.messageBubble.backgroundColor = UIColor(named: MySegue.BrandColor.purple)
                 cell.label.textColor = UIColor(named: MySegue.BrandColor.lightpurple)
            
        }
        
        return cell
    }
    
    
}


