//
//  MainViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 7/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit
import Foundation
import MarqueeLabel
import Toast_Swift

class MainViewController: UIViewController, UIPopoverPresentationControllerDelegate {

    // MARK: - Outlets -
    // MARK: Buttons 
    @IBOutlet weak var optionsButton: UIButton!
    // MARK: Container Views
    @IBOutlet weak var containerView: UIView!
    // MARK: Labels
    @IBOutlet weak var twitterFeed: MarqueeLabel!
    // MARK: Page Control
    @IBOutlet weak var pageControl: UIPageControl!
    
    // MARK: - Global Variables -
    // MARK: Arrays
    let twitterTips = [
        NSLocalizedString("Check out our Patient Portal where you can schedule appointments, email your provider, request refills and more! See one of our receptionists to enroll for free now!", comment: "Twitter Tip"),
        NSLocalizedString("If you are not able to make an appointment, please call to let us know.", comment: "Twitter Tip"),
        NSLocalizedString("Refills can take up to 48 business hours to refill.", comment: "Twitter Tip"), NSLocalizedString("Do you need resources in your community? Do you need help find health coverage for your family? Contact one of our CHWs!", comment: "Twitter Tip")]
    // MARK: Controlller Reference
    var pagerController: MainPageViewController!
    // MARK: Defaults
    let defaults = UserDefaults.standard
    // MARK: Ints
    var pageIndex = 0
    // MARK: Strings
    let informativeText = NSLocalizedString("Check here for latest news and information concerning Valley Professionals Community Health Center.", comment: "Twitter Feed Informative Text")
    
    // MARK: - View Lifecyle -
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Checks if there is a network connection and then updates the bus schedule if there is
        if(Reachability.isConnectedToNetwork() == true){
            getBusSchedule()
        }
        
        // Setup twitter feed
        twitterSetup()
        
        // Listener for exiting the app and then re-entering
        NotificationCenter.default.addObserver(self, selector: #selector(didBecomeActive), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
    }
    override func viewDidAppear(_ animated: Bool) {
        // Initial set of the locationPreference default
        if(defaults.object(forKey:"locationPreference") == nil){
            self.performSegue(withIdentifier: "LocationPreferenceSegue", sender: self)
        }
        // Inital set of the savedLocale default
        if(defaults.object(forKey:"savedLocale") == nil){
            let language = Bundle.main.preferredLocalizations.first
            defaults.set(language!, forKey: "savedLocale")
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .lightContent
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func didBecomeActive(){
    /*   
         Arguments:   None
         Description: Updates the bus schedule and twitter feed when the user re-enters the app after exiting
         Returns:     Nothing
    */
        // Checks if there is a network connection and then updates the bus schedule if there is
        if(Reachability.isConnectedToNetwork() == true){
            getBusSchedule()
        }
        
        // Twitter Feed setup
        twitterSetup()
    }
    
    // MARK: - Network Functions -
    // MARK: Bus Schedule Update
    func getBusSchedule(){
    /*
         Arguments:   None
         Description: Updates the bus schedule from the html file at valleyprohealh.org/info/bus_app_schedule.html and stores it
                      in the default "busSchedule"
         Returns:     Nothing
    */
        var htmlString = ""
        let urlString = "https://valleyprohealth.org/info/bus_app_schedule.html"
        let scheduleURL = URL(string: urlString)
        
        // Attempt to connect to the website with the schedule, get the html from the page, and then parse out the schedule for the day
        do {
            htmlString = try String(contentsOf: scheduleURL!, encoding: .ascii)
            let htmlSplit = htmlString.components(separatedBy: "\n")
            defaults.set(htmlSplit, forKey: "busSchedule")
            
        } catch let error {
            print("Error: \(error)")
        }
        
        // Sets the date of when the bus schedule was stored to be checked later for an outdated schedule
        let date = Date()
        let cal = Calendar.current
        let day = cal.ordinality(of: .day, in: .year, for: date)
        defaults.set(day, forKey: "busScheduleDay")
        
        // Sets the date of when the bus schedule was stored in xx/xx/xxxx to give the users a better understanding when their schedule is outdated.
        defaults.set(date.dateToString(), forKey: "busScheduleDate")
        
    }
    // MARK: Twitter Feed Update
    func twitterSetup(){
    /*
         Arguments:   None
         Description: Get the latest tweet from handle #valleyprohealth, construct twitter feed string, then display it
         in the default "busSchedule"
         Returns:     Nothing
    */
        var feedText = ""
        var htmlString = ""
        let urlString = "https://twitter.com/search?f=tweets&q=from%3AValleyProHealth&src=typd"
        let scheduleURL = URL(string: urlString)

        // Attempt to connect to twitter, get the latest tweet from @valleyprohealth, then put together a feed string
        do {
            htmlString = try String(contentsOf: scheduleURL!, encoding: .ascii)
            let htmlSplit = htmlString.components(separatedBy: "<p class=\"TweetTextSize  js-tweet-text tweet-text\" lang=\"en\" data-aria-label-part=\"0\">")
            let refinedSplit = htmlSplit[1].components(separatedBy: "</p>")
            
            //Converts any html special characters to usable characters
            let tweet = String(htmlEncodedString: refinedSplit[0])
            
            // Final string used in feed when there is a network connection
            feedText = tweet + " " + twitterTips[Int(arc4random_uniform(4))] + " " + informativeText
        } catch let error {
            // Final string used in feed when there is no network connection
            feedText = informativeText + " " + twitterTips[Int(arc4random_uniform(4))]
            print("Error: \(error)")
        }
        
        // Sets the twitter feed text in the feed
        twitterFeed.text = feedText
        twitterFeed.restartLabel()
    }

    // MARK: - Menu Setup -
    // This is used instead of perform segue to get the anchor point just right, otherwise it is off-center.
    @IBAction func optionButtonsTap(_ sender: AnyObject) {
        // Get a reference to the view controller for the popover
        let popController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "menuPopover")
        
        // Set the presentation style
        popController.modalPresentationStyle = UIModalPresentationStyle.popover
        popController.popoverPresentationController!.delegate = self
        
        // Set up the popover presentation controller
        popController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.up
        popController.popoverPresentationController?.sourceView = sender as? UIView // button
        popController.popoverPresentationController?.sourceRect = sender.bounds
        
        // Present the popover
        self.present(popController, animated: true, completion: nil)
    }
    // Makes sure that the menu is displayed as a popover on iphones
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.none
    }
    
    // MARK: - Page Control -
    // Changes page when user taps page control
    @IBAction func pageControlValueChange(_ sender: AnyObject) {
        if(pageIndex == 0){ // If on first page, page right
            pagerController.setViewControllers([orderedViewControllers[1]],
                                                  direction: .forward,
                                                  animated: true,
                                                  completion: nil)
            pageIndex += 1
            
        }else{// If on second page, page left
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
            // This is used to reference the paging left and right functions
            let childViewController = segue.destination as! MainPageViewController
            pagerController = childViewController
        }
    }
    
}

// Makes the page control indicator change
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
