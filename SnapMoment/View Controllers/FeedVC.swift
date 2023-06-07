//
//  FeedVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//

import UIKit
import Firebase

class FeedVC: UIViewController {

    
    @IBOutlet weak var feedTableView: UITableView!
    
    let fireStoreDatabase = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func getUserInfo (){
        fireStoreDatabase.collection("UserInfo").whereField("email", isEqualTo: Auth.auth().currentUser!.email!).getDocuments { snapshot, error in
             if error != nil {
                 makeAlert(title: "Hata", message: error?.localizedDescription ?? "Hata!")
             }else{
                 if snapshot?.isEmpty == false && snapshot != nil {
                     for document in snapshot!.documents {
                         if let username = document.get("username") as? String {
                             UserSingleton.sharedUserInfo.email = Auth.auth().currentUser!.email!
                             UserSingleton.sharedUserInfo.username = username
                     }
                 }
             }
        }
    }
    func makeAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "Tamam", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
    }
}
    }
