//
//  MainViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 7/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Foundation
import MarqueeLabel
import Toast_Swift

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var twitterBird: UIButton!

    @IBOutlet weak var twitterFeed: MarqueeLabel!
    
    
    @IBOutlet weak var optionsButton: UIButton!
    
    let informativeText = NSLocalizedString("Check here for latest news and information concerning Valley Professionals Community Health Center.", comment: "Twitter Feed Informative Text")
    
    let defaults = UserDefaults.standard
    
    var pageIndex = 0
    var pagerController: MainPageViewController!
    
    let twitterTips = [
        NSLocalizedString("Check out our Patient Portal where you can schedule appointments, email your provider, request refills and more! See one of our receptionists to enroll for free now!", comment: "Twitter Tip"),
        NSLocalizedString("If you are not able to make an appointment, please call to let us know.", comment: "Twitter Tip"),
        NSLocalizedString("Refills can take up to 48 business hours to refill.", comment: "Twitter Tip"), NSLocalizedString("Do you need resources in your community? Do you need help find health coverage for your family? Contact one of our CHWs!", comment: "Twitter Tip")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if(Reachability.isConnectedToNetwork() == true){
            getBusSchedule()
        }
        twitterSetup()
        
        //Listener for exiting the app and then re-entering
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Runs the initial location preferences set.
        if(defaults.object(forKey:"locationPreference") == nil){
            self.performSegue(withIdentifier: "LocationPreferenceSegue", sender: self)
        }
        if(defaults.object(forKey:"savedLocale") == nil){
            let language = Bundle.main.preferredLocalizations.first
            defaults.set(language!, forKey: "savedLocale")
        }
    }
    
    func didBecomeActive(){
        //Runs when the user re-enters the app
        if(Reachability.isConnectedToNetwork() == true){
            getBusSchedule()
        }
        twitterSetup()
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
            let htmlSplit = htmlString.components(separatedBy: "\n")
            print(htmlSplit.count)
            defaults.set(htmlSplit, forKey: "busSchedule")
            
        } catch let error {
            print("Error: \(error)")
        }
        
        //Sets the date of when the bus schedule was stored.
        let date = Date()
        let cal = Calendar.current
        let day = cal.ordinality(of: .day, in: .year, for: date)
        defaults.set(day, forKey: "busScheduleDay")
    }
    
    func twitterSetup(){
        var feedText = ""
        var htmlString = ""
        let urlString = "https://twitter.com/search?f=tweets&q=from%3AValleyProHealth&src=typd"
        let scheduleURL = URL(string: urlString)

        do {
            htmlString = try String(contentsOf: scheduleURL!, encoding: .ascii)
            let htmlSplit = htmlString.components(separatedBy: "<p class=\"TweetTextSize  js-tweet-text tweet-text\" lang=\"en\" data-aria-label-part=\"0\">")
            let refinedSplit = htmlSplit[1].components(separatedBy: "</p>")
            //Converts any html special characters to 
            let tweet = String(htmlEncodedString: refinedSplit[0])
            feedText = tweet + " " + twitterTips[Int(arc4random_uniform(4))] + " " + informativeText
        } catch let error {
            feedText = informativeText + " " + twitterTips[Int(arc4random_uniform(4))]
            print("Error: \(error)")
        }
        twitterFeed.text = feedText
        twitterFeed.restartLabel()
    }

    
    //This is used instead of perform segue to get the anchor point just right, otherwise it is off-center.
    @IBAction func optionButtonsTap(_ sender: AnyObject) {
        // get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menuPopover")
        
        // set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        popController.popoverPresentationController!.delegate = self
        
        // set up the popover presentation controller
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.sourceView = sender as? UIView // button
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        // present the popover
        self.present(popController, animated: true, completion: nil)
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        // return UIModalPresentationStyle.FullScreen
        return UIModalPresentationStyle.none
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
