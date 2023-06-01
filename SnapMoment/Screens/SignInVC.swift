//
//  ViewController.swift
//  SnapMoment
//
//  Created by Azim Güneş on 26.05.2023.
//

import UIKit
import Firebase

class SignInVC: UIViewController {
    
    
    @IBOutlet weak var mailTextField: UITextField!
    
   // @IBOutlet weak var usernameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var nameImageView: UIImageView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func SignInButton(_ sender: Any) {
        if mailTextField.text != "" && passwordTextField.text != "" {
            
            Auth.auth().signIn(withEmail: mailTextField.text!, password: passwordTextField.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Hata!", message: error?.localizedDescription ?? "Hata    ")
                } else {
                    self.performSegue(withIdentifier: "toFeedfromSignIn", sender: nil)
                }
            }
        }else {
            self.makeAlert(title: "Hata!", message: "Tüm Alanlar Doldurulmalıdır!")
        }
        
    }
    
    @IBAction func RegisterButton(_ sender: Any) {
        performSegue(withIdentifier: "toRegisterVC", sender: nil)

    }
    
    @IBAction func GoogleButton(_ sender: Any) {
        makeAlert(title: "BİLGİ!", message: "Bu alan şuan kullanıma açık değil.")
    }
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }

}

