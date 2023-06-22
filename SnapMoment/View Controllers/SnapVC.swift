//
//  SnapVC.swift
//  SnapMoment
//
//  Created by Azim Güneş on 31.05.2023.
//

import UIKit
import ImageSlideshow

class SnapVC: UIViewController {
    
    @IBOutlet weak var scrolButton: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var selectedSnap : Snap?
    var selectedTime : Int?
    var inputArray = [SDWebImageSource]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    

        if let time = selectedTime {
            timeLabel.text! = "\(time) Saat Sonra Kaybolacak."

        }
        if let snap = selectedSnap {
            for imageUrl in snap.imageUrlArray {
                inputArray.append(SDWebImageSource(urlString: imageUrl)!)
                            }
            let imageSlideShow = ImageSlideshow(frame: CGRect(x: 10, y: 10, width: self.view.frame.width*0.95, height: self.view.frame.height*0.90 ))
            imageSlideShow.backgroundColor = UIColor.clear
            
            let pageInd = UIPageControl()
            pageInd.currentPageIndicatorTintColor = UIColor.lightGray
            pageInd.pageIndicatorTintColor = UIColor.black
            imageSlideShow.pageIndicator = pageInd
            
            
            
            imageSlideShow.contentScaleMode = UIViewContentMode.scaleAspectFit
            imageSlideShow.setImageInputs(inputArray)
            self.view.addSubview(imageSlideShow)
            self.view.bringSubviewToFront(timeLabel)
        }

    }

}
