//
//  RegisterVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var scrolImage: UIImageView!
    
    @IBOutlet weak var nameText: UITextField!
    
    @IBOutlet weak var usernameText: UITextField!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrolImage.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SegueFunc))
        scrolImage.addGestureRecognizer(gestureRecognizer)

    }
    

    @IBAction func createAccountButton(_ sender: UIButton) {
        if usernameText.text != "" && emailText.text != "" && nameText.text != "" && passwordText.text != "" {
            Auth.auth().createUser(withEmail: emailText.text!, password: passwordText.text!) { auth, error in
                if error != nil {
                    self.makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata!")
                }else{
                    
                    let fireStore = Firestore.firestore()
                    
                    let userDictoanry = ["email": self.emailText.text!, "username": self.usernameText.text!] as! [String : Any ]
                    fireStore.collection("UserInfo").addDocument(data: userDictoanry).setData(userDictoanry) { error in
                        if error != nil {
                            self.makeAlert(title: "Hata!", message: "Hatalı Bir Durum Var!")
                        }
                    }
                    
                    
                    self.performSegue(withIdentifier: "toFeedVC", sender: nil)
                }
            }
            
        }else {
            makeAlert(title: "Hata!", message: "Boş kısımları doldurunuz!")
        }
    }
    
    
    @IBAction func haveAccountButton(_ sender: UIButton) {
performSegue(withIdentifier: "toSignInVCfromReg", sender: nil)
    }
    
    
    
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
    
    @objc func SegueFunc (){
        performSegue(withIdentifier: "toSignInVCfromReg", sender: nil)
    }
}
