//
//  HPIDetailViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 26/04/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit

class HPIViewController: ViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        // Do any additional setup after loading the view.
        
        let vcPhoto = (self.storyboard?.instantiateViewController(withIdentifier: "PhotoViewController"))! as! ViewController
        
        vcPhoto.detailData = self.detailData
        self.addChildViewController(vcPhoto)
        self.scrollView.addSubview(vcPhoto.view)
        vcPhoto.didMove(toParentViewController: self)
        
        let vcProjects = (self.storyboard?.instantiateViewController(withIdentifier: "ProjectsViewController"))! as! ViewController
        
        vcProjects.detailData = self.detailData
        var frame1 = vcProjects.view.frame
        frame1.origin.x = self.view.frame.size.width
        vcProjects.view.frame = frame1
        
        self.addChildViewController(vcProjects)
        self.scrollView.addSubview(vcProjects.view)
        vcProjects.didMove(toParentViewController: self)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.size.height)
        
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
