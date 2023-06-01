//
//  UploadVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//

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
    }
    
    
    
}
