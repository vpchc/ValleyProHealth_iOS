//
//  MainPageViewController.swift
//  ValleyProHealth
//
//  Created by Brice Webster on 8/29/16.
//  Copyright © 2016 Valley Professionals Community Health Center. All rights reserved.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    // MARK: - Global Variables -
    // MARK: Ints
    var pageControlChange = 0
    // MARK: Controller References
    weak var pageControlDelegate: MainPageViewControllerDelegate?
    
    // MARK: - View Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Connect data for pager
        dataSource = self
        delegate = self
        
        // Setup initial page for pager
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
     
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
//Array of pages for pager
private(set) var orderedViewControllers: [UIViewController] = {
    return [newScreenViewController("Main"),
            newScreenViewController("Secondary")]
}()

//Initiates a new controller when paging
private func newScreenViewController(_ selection: String) -> UIViewController {
    return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(selection)ScreenViewController")
}

//Makes the paging left and right happen
extension MainPageViewController: UIPageViewControllerDataSource {
    
    // Page left
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
    }
    
    // Page right
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
}

// Used to update the page control
extension MainPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                                               previousViewControllers: [UIViewController],
                                               transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            pageControlDelegate?.mainPageViewController(self,
                                                         didUpdatePageIndex: index)
        }
    }
    
}
protocol MainPageViewControllerDelegate: class {
    
    /**
     Called when the number of pages is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter count: the total number of pages.
     */
    func mainPageViewController(_ mainPageViewController: MainPageViewController,
                                    didUpdatePageCount count: Int)
    
    /**
     Called when the current index is updated.
     
     - parameter tutorialPageViewController: the TutorialPageViewController instance
     - parameter index: the index of the currently visible page.
     */
    func mainPageViewController(_ mainPageViewController: MainPageViewController,
                                    didUpdatePageIndex index: Int)

    
}
