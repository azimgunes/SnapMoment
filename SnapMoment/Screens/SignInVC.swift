//
//  ViewController.swift
//  SnapMoment
//
//  Created by Azim Güneş on 26.05.2023.
//

import UIKit

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var nameImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterVC", sender: nil)

    }
    
    @IBAction func GoogleButton(_ sender: Any) {
    }
    
    

}

