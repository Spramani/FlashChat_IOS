//
//  LoginViewController.swift
//  FlashChat
//
//  Created by MAC on 03/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var EmailLogin: UITextField!
    @IBOutlet weak var PassswordLogin:UITextField!

    @IBAction func login(_ sender: UIButton) {
        
        if let email = EmailLogin.text, let password = PassswordLogin.text {
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
          
            if let e = error {
                print(e.localizedDescription)
            }else{
                self?.performSegue(withIdentifier: MySegue.LoginTochat, sender: self)
            }
            
            }
            
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
