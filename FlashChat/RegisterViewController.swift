//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by MAC on 03/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registration(_ sender: UIButton) {
       
        if let email = Email.text, let password = Password.text {
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let e = error {
                print(e.localizedDescription)
            } else {
                //transfer to next view controller
                self.performSegue(withIdentifier: MySegue.registerTochat, sender: self)
                
                
            }
            }
        }
    }
    @IBOutlet weak var Email:UITextField!
    @IBOutlet weak var Password: UITextField!
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
