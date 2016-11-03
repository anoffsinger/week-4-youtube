//
//  HamburgerViewController.swift
//  YouTube
//
//  Created by Adam Noffsinger on 11/3/16.
//  Copyright © 2016 Adam Noffsinger. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var feedView: UIView!
    
    var menuViewController: UIViewController!
    var feedViewController: UIViewController!   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let newMenuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let newFeedViewController = storyboard.instantiateViewController(withIdentifier: "FeedViewController") as! FeedViewController
        
        addChildViewController(newMenuViewController)
        menuView.addSubview(newMenuViewController.view)
        newMenuViewController.didMove(toParentViewController: self)
        
        addChildViewController(newFeedViewController)
        feedView.addSubview(newFeedViewController.view)
        newFeedViewController.didMove(toParentViewController: self)
        
//        menuView.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didSwipeFeed(_ sender: UIPanGestureRecognizer) {
        
        let velocity = sender.velocity(in: view)
        let translation = sender.translation(in: view)
        
        if sender.state == .began {
            print("Gesture began")
        } else if sender.state == .changed {
            feedView.frame.origin.x = translation.x
        } else if sender.state == .ended {
            if velocity.x > 0 {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options:[] , animations: { () -> Void in
                    self.feedView.center.x = 430.0
//                    self.menuView.transform = self.menuView.transform.scaledBy(x: 1.11, y: 1.11)
                }, completion: nil)
                
            } else {
                UIView.animate(withDuration:0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options:[] , animations: { () -> Void in
                    self.feedView.center.x = 160.0
//                    self.menuView.transform = self.menuView.transform.scaledBy(x: 0.9, y: 0.9)
                }, completion: nil)
            }
        }
    }
    
    


}
