//
//  ViewController.swift
//  WWDC16CV
//
//  Created by Alec Schneider on 01/05/16.
//  Copyright © 2016 Alec Schneider. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var detailData: Int = 0
    
    var hpiDetailData: [String: String] = [
        "livePhotoURL": "IMG_6321",
        "insidePhoto": "hpiInside",
        "titleLabel": "Hasso Plattner Insitute",
        "descriptionLabel": "This is where I study IT-System Engineering. \n It is part of the University of Potsdam and was founded by Professor Hasso Plattner, current Chairman of SAP. \n It is Germany's leading Institute for Computer Science, Engeneering and Tech Entrepreneurship. \n \n This is also where I am leading the Mobile Developer Club of the HPI as an iOS Developer. At the Club we teach new Students how to develop for mobile platforms and develop the HPI App.",
        "project1": "mobiledev",
        "project2": "hpiapp"
    ]
    
    var villaDetailData: [String: String] = [
        "livePhotoURL": "IMG_6338",
        "insidePhoto": "villaInside",
        "titleLabel": "The Villa",
        "descriptionLabel": "This is my place of work. \n I am working here as a Student Research assistant at the Research Group \"Enterprise Platform and Integration Concepts\" of Prof. Dr. Hasso Plattner. \n Here it is all about SAP HANA and In-Memory Data Management.",
        "project1": "socceranalytics",
        "project2": "taxidata"
    ]
    
    var homeDetailData: [String: String] = [
        "livePhotoURL": "IMG_6326",
        "insidePhoto": "homeInside",
        "titleLabel": "152a - Home",
        "descriptionLabel": "This is where I live. \n This is where the magic happens. \n Here I am working on my own Projects and Ideas and bringing them to life. \n ",
        "project1": "emotechatbot",
        "project2": "catch"
    ]
    
    var projects: [String: [String: String]] = [
        "socceranalytics": [
            "icon": "soccericon",
            "title": "Interactive Tactic Board",
            "description": "This is my main Project at work. We have a couple of datasets for Bundesliga games where we have position data for every player and the ball with a frequency of 30 times per second. All this Data is stored in our HANA which is a In-Memory database so that we can do calculation on a lot of data in a short time. We build this web app where you can model one or more plays and our backend will find you the exact situation in all our games and you can jump right to the situation in form of a video. Or you can watch the video and say I want to get this situation modelled and it bring you to the tactic board and display the play.",
            "bigImage": "socceranalytics"
        ],
        "taxidata": [
            "icon": "taxiicon",
            "title": "Analyzing Cab Data from NYC",
            "description": "This is the project I am recently working on. We have almost 700 Million taxi rides of New York City (mainly Manhattan) from the years 2010-2013 in our database. Now it was my job to build a web app to visualise this data and to make it useful. So I added many ways to narrow the data down, like time in years, months, weeks, weekdays and even hours or you can select only certain locations on the map and every graph will update because everything is dependant on each other.",
            "bigImage": "taxiData"
        ],
        "catch": [
            "icon": "catchicon",
            "title": "Catch App",
            "description": "This app is an idea from a few students of our HPI School of Design Thinking. They founded a startup and got funded. A friend refereed me to them and now I am building their iOS app. \n Catch is an app where you find your favourite radio channel and when you hear something that you want to remember later, you press the button and it will be saved in your read later list. So when you have the time you can find the song you just listen to and add it to your Apple Music Library or that story you wanted to know more about you can know read up on it.",
            "smallImage1": "catch2",
            "smallImage2": "catch1"
        ],
        "emotechatbot": [
            "icon": "emotechatboticon",
            "title": "@EmoteChatBot",
            "description": "This is a bot you can use in the messenger Telegram. I builded this bot for me and my friend but later decided to release it. It has over 2k unique user a month and around 300 users a day and growing. Its idea is pretty basic you can use any text phrase to connect to any media you want. So every time someone write the text phrase in the chat the bot will post what ever you connected it to, like a photo, gif or sticker.",
            "smallImage1": "emote",
            "smallImage2": "emote1"
        ],
        "mobiledev": [
            "icon": "mobdevicon",
            "title": "Mobile Developer Club Promotion",
            "description": "Like I said I am one of the leaders of our MobileDeveloper Club here at HPI. I made this app/video at the beginning of last semester to promote the club and get the attention of the newer students. With success over 30 new people showed up. The video is in german, was filmed on an iPhone, cut in iMovie and shot in Miami Beach, Fl.",
            "video": "true"
        ],
        "hpiapp": [
            "icon": "hpiappicon",
            "title": "HPI App",
            "description": "This is the main purpose of the MobileDeveloper Club. The HPI app is not in the stores yet but the app is ready for launch and we are currently planning our launch party. If you are not a student of our institute the app displays you our news, interviews (we have this video blog where we interview people about IT like our chancellor Angela Merkel or SAP CEO Bill McDermott etc.) , our campus and other useful information. But if you are a student you can login via your HPI account and get access to our file archives, timetables, today’s canteen menu and more. ",
            "smallImage1": "hpi1",
            "smallImage2": "hpi2"
        ]
    ]


    override func viewDidLoad() {
        super.viewDidLoad()

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
