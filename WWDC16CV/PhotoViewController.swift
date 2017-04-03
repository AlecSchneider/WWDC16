//
//  FotoViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 29/04/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit
import PhotosUI;

class PhotoViewController: ViewController {

    @IBOutlet weak var arrowLabel: UILabel!
    @IBOutlet weak var arrow: UIImageView!
    
    override func viewDidLoad() {
        
        var data: [String: String] = [:]
        
        switch self.detailData {
            
        case 0:
            data = self.hpiDetailData
            self.view.backgroundColor = UIColor.orange()
            break
        case 1:
            data = self.villaDetailData
            self.view.backgroundColor = UIColor.blue()
            break
        case 2:
            data = self.homeDetailData
            self.view.backgroundColor = UIColor.green()
            break
        default:
            print("default")
        }

        let liveView: PHLivePhotoView
        liveView = PHLivePhotoView(frame: self.view.frame)
        
        let imageURL = Bundle.main.urlForResource(data["livePhotoURL"], withExtension: "JPG")!
        let videoURL = Bundle.main.urlForResource(data["livePhotoURL"], withExtension: "MOV")!
        
        PHLivePhoto.request(withResourceFileURLs: [imageURL, videoURL], placeholderImage: nil, targetSize: CGSize.zero, contentMode: .aspectFill) {
            (livePhoto, infoDict) -> Void in
            // This "canceled" condition is just to avoid redundant passes in the Playground preview panel.
            if let canceled = infoDict[PHLivePhotoInfoCancelledKey] as? Int, canceled == 0 {
                if let livePhoto = livePhoto {
                    liveView.livePhoto = livePhoto
                }
            }
        }
        
        liveView.startPlayback(with: .hint)
        

        self.view.addSubview(liveView)
        self.view.bringSubview(toFront: arrow)
        self.view.bringSubview(toFront: arrowLabel)
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
