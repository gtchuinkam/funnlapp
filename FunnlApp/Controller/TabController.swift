//
//  TabController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/12/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class TabController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpTabBar()
        tabBar.tintColor = .systemRed
        tabBar.isTranslucent = false    
        tabBar.backgroundColor = UIColor(named: "navbar-header-color")
        
    }

    func setUpTabBar(){
        
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 24)!, .foregroundColor: UIColor(named: "background-text-icon-color")!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        let dashboardVC = UINavigationController(rootViewController: DashboardViewController())
        dashboardVC.tabBarItem.image = UIImage(named: "user-icon")
        
        let industryVC = UINavigationController(rootViewController: IndustryViewController())
        industryVC.tabBarItem.image = UIImage(named: "search-icon")
        
        viewControllers = [dashboardVC, industryVC]
    }
    
}
