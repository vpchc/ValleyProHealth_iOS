//
//  MainViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 7/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Foundation

class MainViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var twitterBird: UIButton!
    
    let defaults = UserDefaults.standard
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainPageViewController = segue.destination as? MainPageViewController {
            mainPageViewController.pageControlDelegate = self
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        getBusSchedule()
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getBusSchedule(){
        var htmlString = ""
        let urlString = "https://valleyprohealth.org/info/bus_app_schedule.html"
            guard let scheduleURL = URL(string: urlString) else {
            print("Error: \(urlString) doesn't seem to be a valid URL")
            return
        }
    
        do {
            htmlString = try String(contentsOf: scheduleURL, encoding: .ascii)
            let htmlSplit = htmlString.components(separatedBy: "/n")
            defaults.set(htmlSplit, forKey: "busSchedule")
            print("HTML : \(htmlString)")
            
        } catch let error {
            print("Error: \(error)")
        }
    }

    @IBAction func twitterBirdTap(_ sender: AnyObject) {
        let application = UIApplication.shared
        
        let twitterApp: URL = URL(string:"twitter:///user?screen_name=valleyprohealth")!
        let twitterUrl: URL = URL(string:"https://twitter.com/ValleyProHealth")!
        
        //Open the facebook app to the vpchc profile is the app is available, otherwise open in the browser
        if application.canOpenURL(twitterApp) {
            application.openURL(twitterApp)
        } else {
            application.openURL(twitterUrl)
        }

    }
     
    
}
extension MainViewController: MainPageViewControllerDelegate {
    
    func mainPageViewController(_ mainPageViewController: MainPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func mainPageViewController(_ mainPageViewController: MainPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}
