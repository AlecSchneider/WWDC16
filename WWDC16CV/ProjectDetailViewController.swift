//
//  ProjectDetailViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 01/05/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit

class ProjectDetailViewController: ViewController {
    
    var projectData: [String: String] = [:]

    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bigImage: UIImageView!
    @IBOutlet weak var smallImage1: UIImageView!
    @IBOutlet weak var smallImage2: UIImageView!
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = projectData["title"]
        descriptionView.text = projectData["description"]
        
        if let image = projectData["bigImage"] {
            bigImage.image = UIImage(named: image)
            bigImage.isHidden = false
        }
        
        if let image = projectData["smallImage1"] {
            smallImage1.image = UIImage(named: image)
            smallImage1.isHidden = false
        }
        
        if let image = projectData["smallImage2"] {
            smallImage2.image = UIImage(named: image)
            smallImage2.isHidden = false
        }
        
        if (projectData["video"] != nil) {
            webView.allowsInlineMediaPlayback = true
            let embededHTML = "<html><body><iframe width=\"374\" height=\"229\" src=\"https://www.youtube.com/embed/1QI0JUnEk24\" frameborder=\"0\" allowfullscreen></iframe></html>"
            webView.loadHTMLString(embededHTML, baseURL: Bundle.main.bundleURL)
            webView.isHidden = false
        }
        
        iconImage.image = UIImage(named: projectData["icon"]!)
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
