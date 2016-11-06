//
//  MenuViewController.swift
//  HamburgerMenu
//
//  Created by Ernest on 11/5/16.
//  Copyright © 2016 Purpleblue Pty Ltd. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private var greenNavigationController: UIViewController!
    private var blueNavigationController: UIViewController!
    private var pinkNavigationController: UIViewController!
    
    var viewControllers: [UIViewController] = []
    
    var hamburgerViewController: HamburgerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        greenNavigationController = storyboard.instantiateViewController(withIdentifier: "GreenNavigationController")
        blueNavigationController = storyboard.instantiateViewController(withIdentifier: "BlueNavigationController")
        pinkNavigationController = storyboard.instantiateViewController(withIdentifier: "PinkNavigationController")
        
        viewControllers.append(greenNavigationController)
        viewControllers.append(blueNavigationController)
        viewControllers.append(pinkNavigationController)
        
        // On bootup load the green vc
        hamburgerViewController.contentViewController = greenNavigationController
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - TableView

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuTableViewCell
        
        let titles = ["Green", "Blue", "Pink"]
        cell.menuTitleLabel.text = titles[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // deselect the gray selection
        tableView.deselectRow(at: indexPath, animated: true)
        
        // Switch between controllers based on menu selection
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
    }

}
