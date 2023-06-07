//
//  ProfileVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func logOutButton(_ sender: UIButton) {
        
        
        do {
            try Auth.auth().signOut()
            performSegue(withIdentifier: "toSignInVC", sender: nil)
        } catch {
            
        }
    }
    
    

}
