//
//  teesasPlacePageView.swift
//  Teesas
//
//  Created by Ayush Pathak on 16/03/20.
//  Copyright © 2020 Appentus Technologies Pvt. Ltd. All rights reserved.
//

import UIKit

class teesasPlacePageView: UIPageViewController, UIPageViewControllerDelegate,UIPageViewControllerDataSource {

    var pages = [UIViewController]()
    var curr = Int()
    var current = Int()
    
    var last_x : CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        let p1: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "teesasPlaceForYouViewController") as! teesasPlaceForYouViewController
        let p2: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "teesasAboutUsViewController") as! teesasAboutUsViewController
        let p3: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "teesasNewsViewController") as! teesasNewsViewController
        let p4: UIViewController! = storyboard?.instantiateViewController(withIdentifier: "teesasTestimonialsViewController") as! teesasTestimonialsViewController

        
        pages.append(p1)
        pages.append(p2)
        pages.append(p3)
        pages.append(p4)

        setViewControllers([p1], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.move_by_buttons(_:)), name: Notification.Name("move_by_buttonsPlace"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.removeObserversThis(_:)), name: NSNotification.Name("removeAllObservers"), object: nil)
    }
    @objc func removeObserversThis(_ sender:NSNotification){
           NotificationCenter.default.removeObserver(self)
       }
      
    @objc func move_by_buttons(_ sender:NSNotification) {
        let index = sender.object as! Int
        self.setViewControllers([pages[index-1]], direction: .forward, animated: true, completion: nil)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController)-> UIViewController? {
        
        curr = pages.index(of: viewController)!
        
        // if you prefer to NOT scroll circularly, simply add here:
        if curr == 0 { return nil }
        let prev = abs((curr - 1) % pages.count)
        return pages[prev]
        
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController)-> UIViewController? {
        
        let current = pages.firstIndex(of: viewController)!
        // if you prefer to NOT scroll circularly, simply add here:
        if current == (pages.count - 1) { return nil }
        let nxt = abs((current + 1) % pages.count)
        return pages[nxt]
    }
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
    {
        if (!completed)
        {
            return
        }
        let visibleViewController = pageViewController.viewControllers?.first
        let index = self.pages.firstIndex(of: visibleViewController!)
        NotificationCenter.default.post(name: Notification.Name("get_offset_set_viewPlace"), object: index!)

    }
}
