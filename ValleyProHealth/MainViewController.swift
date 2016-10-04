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
    
    @IBOutlet weak var twitterFeed: UILabel!
    
    @IBOutlet weak var optionsButton: UIButton!
    
    let defaults = UserDefaults.standard
    
    var pageIndex = 0
    var pagerController: MainPageViewController!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        twitterSetup()
        getBusSchedule()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Runs the initial location preferences set.
        if(defaults.object(forKey:"locationPreference") == nil){
            self.performSegue(withIdentifier: "LocationPreferenceSegue", sender: self)
        }
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
    
    func twitterSetup(){
        var htmlString = ""
        let urlString = "https://twitter.com/search?f=tweets&q=from%3AValleyProHealth&src=typd"
        guard let scheduleURL = URL(string: urlString) else {
            print("Error: \(urlString) doesn't seem to be a valid URL")
            return
        }
        
        do {
            htmlString = try String(contentsOf: scheduleURL, encoding: .ascii)
            let htmlSplit = htmlString.components(separatedBy: "<p class=\"TweetTextSize  js-tweet-text tweet-text\" lang=\"en\" data-aria-label-part=\"0\">")
            let refinedSplit = htmlSplit[1].components(separatedBy: "</p>")
            print("HTML : \(refinedSplit[0])")
          twitterFeed.text = refinedSplit[0]
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
    
    //This is used instead of perform segue to get the anchor point just right, otherwise it is off-center.
    @IBAction func optionButtonsTap(_ sender: AnyObject) {
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menuPopover")
        
        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        
        // set up the popover presentation controller
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.sourceView = sender as? UIView // button
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
    }
    
    @IBAction func pageControlValueChange(_ sender: AnyObject) {
        if(pageIndex == 0){
            pagerController.setViewControllers([orderedViewControllers[1]],
                                                  direction: .forward,
                                                  animated: true,
                                                  completion: nil)
            pageIndex += 1
            
        }else{
            pagerController.setViewControllers([orderedViewControllers[0]],
                                                   direction: .reverse,
                                                   animated: true,
                                                   completion: nil)
            pageIndex -= 1
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let mainPageViewController = segue.destination as? MainPageViewController {
            mainPageViewController.pageControlDelegate = self
        }
        if (segue.identifier == "PagerContainerSegue") {
            //This is used to reference the paging left and right functions
            let childViewController = segue.destination as! MainPageViewController
            pagerController = childViewController
        }
    }
    // UIPopoverPresentationControllerDelegate method
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        // Force popover style
        return UIModalPresentationStyle.none
    }
}

extension MainViewController: MainPageViewControllerDelegate {
    
    func mainPageViewController(_ mainPageViewController: MainPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func mainPageViewController(_ mainPageViewController: MainPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageIndex = index
        pageControl.currentPage = index
    }
    
}
