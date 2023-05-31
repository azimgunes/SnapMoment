//
//  RegisterVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//

import UIKit

class RegisterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


    @IBAction func haveAccountButton(_ sender: UIButton) {
        performSegue(withIdentifier: "toSignInVCfromReg", sender: nil)
    }
}
