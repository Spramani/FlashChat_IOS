//
//  ViewController.swift
//  FlashChat
//
//  Created by MAC on 03/09/20.
//  Copyright © 2020 MAC. All rights reserved.
//

import UIKit
import CLTypingLabel

class ViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden =  true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
                 navigationController?.isNavigationBarHidden = false
            
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = MySegue.title
        
        // Do any additional setup after loading the view.
    }

    @IBAction func Login(_ sender: UIButton) {
    }
    @IBAction func Registration(_ sender: UIButton) {
    }
    @IBOutlet weak var label:CLTypingLabel!
}

