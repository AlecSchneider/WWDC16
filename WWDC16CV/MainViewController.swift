//
//  MainViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 30/04/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit

class MainViewController: ViewController {
        
    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        
        let vcMy = (self.storyboard?.instantiateViewController(withIdentifier: "MyViewController"))! as! ViewController
        
        self.addChildViewController(vcMy)
        self.scrollView.addSubview(vcMy.view)
        vcMy.didMove(toParentViewController: self)
        
        let vcMap = (self.storyboard?.instantiateViewController(withIdentifier: "ViewController"))! as! ViewController
        
        var frame1 = vcMap.view.frame
        frame1.origin.x = self.view.frame.size.width
        vcMap.view.frame = frame1
        
        self.addChildViewController(vcMap)
        self.scrollView.addSubview(vcMap.view)
        vcMap.didMove(toParentViewController: self)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 2, height: self.view.frame.size.height)
        
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
