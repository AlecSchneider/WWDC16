//
//  MyViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 30/04/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit
import PhotosUI;

class MyViewController: ViewController {

    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    
    override func viewDidLoad() {
        let liveView: PHLivePhotoView
        liveView = PHLivePhotoView(frame: self.view.frame)
        
        let imageURL = Bundle.main().urlForResource("IMG_6305", withExtension: "JPG")!
        let videoURL = Bundle.main().urlForResource("IMG_6305", withExtension: "MOV")!
        
        PHLivePhoto.request(withResourceFileURLs: [imageURL, videoURL], placeholderImage: nil, targetSize: CGSize.zero, contentMode: .aspectFill) {
            (livePhoto, infoDict) -> Void in
            // This "canceled" condition is just to avoid redundant passes in the Playground preview panel.
            if let canceled = infoDict[PHLivePhotoInfoCancelledKey] as? Int where canceled == 0 {
                if let livePhoto = livePhoto {
                    liveView.livePhoto = livePhoto
                }
            }
        }
        
        liveView.startPlayback(with: .hint)
        liveView.isMuted = true
        
        
        self.view.addSubview(liveView)
        self.view.bringSubview(toFront: desc)
        self.view.bringSubview(toFront: arrow)
        self.view.bringSubview(toFront: arrowLabel)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
