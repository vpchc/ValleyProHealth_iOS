//
//  MainViewController.swift
//  ValleyProHealth
//
//  Created by Brice Local Account on 7/21/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var twitterBird: UIButton!
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let mainPageViewController = segue.destinationViewController as? MainPageViewController {
            mainPageViewController.pageControlDelegate = self
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func twitterBirdTap(sender: AnyObject) {
        let application = UIApplication.sharedApplication()
        
        let twitterApp: NSURL = NSURL(string:"twitter:///user?screen_name=valleyprohealth")!
        let twitterUrl: NSURL = NSURL(string:"https://twitter.com/ValleyProHealth")!
        
        //Open the facebook app to the vpchc profile is the app is available, otherwise open in the browser
        if application.canOpenURL(twitterApp) {
            application.openURL(twitterApp)
        } else {
            application.openURL(twitterUrl)
        }

    }
     
    
}
extension ViewController: MainPageViewControllerDelegate {
    
    func mainPageViewController(mainPageViewController: MainPageViewController,
                                    didUpdatePageCount count: Int) {
        pageControl.numberOfPages = count
    }
    
    func mainPageViewController(mainPageViewController: MainPageViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}