//
//  HamburgerViewController.swift
//  HamburgerMenu
//
//  Created by Ernest on 11/5/16.
//  Copyright © 2016 Purpleblue Pty Ltd. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    var originalLeftMargin: CGFloat!
    
    var menuViewController: UIViewController! {
        didSet {
            view.layoutIfNeeded()
            
            menuView.addSubview(menuViewController.view)
        }
    }
    
    var contentViewController: UIViewController! {
        didSet(oldContentViewController) {
            view.layoutIfNeeded()
            
            // Remove old vc when switching to a new vc from hamburger menu
            if oldContentViewController != nil {
                oldContentViewController.willMove(toParentViewController: nil)
                oldContentViewController.view.removeFromSuperview()
                oldContentViewController.didMove(toParentViewController: nil)
            }
            
            // Clean way to add new vc
            contentViewController.willMove(toParentViewController: self)
            contentView.addSubview(contentViewController.view)
            contentViewController.didMove(toParentViewController: self)
            
            // Close hamburger menu on selection
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.leftMarginConstraint.constant = 0
                self.view.layoutIfNeeded()
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            originalLeftMargin = leftMarginConstraint.constant
        } else if sender.state == UIGestureRecognizerState.changed {
            leftMarginConstraint.constant = originalLeftMargin + translation.x
        } else if sender.state == UIGestureRecognizerState.ended {
            // Animates the snapping back and forth of the menu to be smoother
            UIView.animate(withDuration: 0.3, animations: {
                // Snaps the menu back and forth
                if velocity.x > 0 {
                    self.leftMarginConstraint.constant = self.view.frame.size.width - 100
                } else {
                    self.leftMarginConstraint.constant = 0
                }
                self.view.layoutIfNeeded()
            })

        }
    }

}
