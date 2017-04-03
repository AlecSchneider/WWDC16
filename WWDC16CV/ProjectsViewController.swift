//
//  ProjectsViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 29/04/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit

class ProjectsViewController: ViewController {
    
    var data: [String: String] = [:]

    @IBOutlet weak var bgImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    
    @IBAction func prepareForUndo(_ segue: UIStoryboardSegue){
    }
    override func viewDidLoad() {
        
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
        
        bgImage.image = UIImage(named: data["insidePhoto"]!)
        titleLabel.text = data["titleLabel"]
        descriptionLabel.text = data["descriptionLabel"]
        
        button1.setImage(UIImage(named: self.projects[data["project1"]!]!["icon"]!), for: UIControlState())
        button1.imageView?.contentMode = .scaleAspectFit
        
        
        button2.setImage(UIImage(named: self.projects[data["project2"]!]!["icon"]!), for: UIControlState())
        button2.imageView?.contentMode = .scaleAspectFit
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "detail1" {
            if let destination = segue.destinationViewController as? ProjectDetailViewController {
                destination.projectData = self.projects[data["project1"]!]!
            }
        }
        else if segue.identifier == "detail2" {
            if let destination = segue.destinationViewController as? ProjectDetailViewController {
                destination.projectData = self.projects[data["project2"]!]!
            }
        }

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
