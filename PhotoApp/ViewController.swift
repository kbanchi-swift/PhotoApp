//
//  ViewController.swift
//  PhotoApp
//
//  Created by 伴地慶介 on 2021/11/13.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func loginAction(_ sender: Any) {
        
        // Firebase Login
        Auth.auth().signInAnonymously{(authResult,error) in
            let user = authResult?.user
            print(user)
            
            // transition view controller
            let inputVC = self.storyboard?.instantiateViewController(withIdentifier: "inputViewController") as! InputViewController
            self.navigationController?.pushViewController(inputVC, animated: true)
        }
    }
    
}

