//
//  UploadVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//
import Firebase
import UIKit

class UploadVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    
    @IBOutlet weak var shareTitleLabel: UIImageView!
    
    
    
    @IBOutlet weak var uploadImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        uploadImageView.isUserInteractionEnabled = true
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(selectedPic))
        uploadImageView.addGestureRecognizer(gestureRecognizer)

        // Do any additional setup after loading the view.
    }
    
    @objc func selectedPic (){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = .photoLibrary
        self.present(picker, animated: true)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        uploadImageView.image = info[ .originalImage] as? UIImage
        self.dismiss(animated: true)
    }
    
    @IBAction func uploadButton(_ sender: UIButton) {
        
        
        
        
        
        let storage = Storage.storage()
        
        let storageReference = storage.reference()
        
        
        let mediaFolder = storageReference.child("media")
        
        if let data = uploadImageView.image?.jpegData(compressionQuality: 0.5) {
            
            let uuid = UUID().uuidString
            
            let imageRef = mediaFolder.child("\(uuid).jpg")
            
            imageRef.putData(data) { metadata, error in
                if error != nil {
                    self.makeAlert(title: "Hata!", message: error!.localizedDescription)
                }else {
                    imageRef.downloadURL { url, error in
                        if error == nil {
                            let imageUrl = url?.absoluteString
                            
                            
                            
                            
                            
                            let fireStore = Firestore.firestore()
                            
                            fireStore.collection("Snaps").whereField("snapOwner", isEqualTo: UserSingleton.sharedUserInfo.username).getDocuments { snaphsot, error in
                                if error != nil {
                                    self.makeAlert(title: "Hata!", message: error?.localizedDescription ?? "Hata")
                                }else {
                                    if snaphsot?.isEmpty == false && snaphsot != nil {
                                        for document in snaphsot!.documents {
                                            let documentId = document.documentID
                                            if var imageUrlArray = document.get("imageUrlArray") as? [String] {
                                                imageUrlArray.append(imageUrl!)
                                                
                                                let addDic = ["imageUrlArray": imageUrlArray] as [String : Any]
                                                
                                                fireStore.collection("Snaps").document(documentId).setData(addDic, merge: true) { error in
                                                    if error == nil {
                                                        self.tabBarController?.selectedIndex = 0
                                                        self.uploadImageView.image = UIImage(named: "uploadcolorful.png")
                                                    }
                                                }
                                            }
                                        }
                                    }else{
                                        let snapDictionary = ["imageUrlArray" : [imageUrl!], "snapOwner": UserSingleton.sharedUserInfo.username, "date" : FieldValue.serverTimestamp()] as [String : Any]
                                        
                                        fireStore.collection("Snaps").addDocument(data: snapDictionary) { error in
                                            if error != nil {
                                                self.makeAlert(title: "Hata", message: error!.localizedDescription)
                                            }else {
                                                self.tabBarController?.selectedIndex = 0
                                                self.uploadImageView.image = UIImage(named: "uploadcolorful.png")
                                            }
                                        }
                                    }
                                }
                            }
                            
                            
                            
                      
                        }
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
