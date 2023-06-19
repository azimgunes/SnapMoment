//
//  SnapVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//

import UIKit

class SnapVC: UIViewController {
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedSnap : Snap?
    var selectedTime : Int?
    

    override func viewDidLoad() {
        
        if let time = selectedTime {
            timeLabel.text! = "\(time) Saat Sonra Kaybolacak."

        }
        
        super.viewDidLoad()

    }
    


}
