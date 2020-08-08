//
//  DashboardViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/8/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {

    //MARK: - UI Elements Initialization
    
    
    
    //MARK: - viewDidLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        setUpNavBar()
    }
    
    //MARK: - Constraint Functions

    func setUpNavBar(){
        
        //Background Styling
        navigationController?.navigationBar.barTintColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.isTranslucent = false
        
        //Text Styling
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 24)!, .foregroundColor: UIColor(named: "background-text-icon-color")!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        self.title = "Dashboard"
        
        //Button styling
        let addButton = UIButton(type: .system)
        addButton.setImage(UIImage(named: "add-icon"), for: .normal)
        addButton.tintColor = UIColor(named: "background-text-icon-color")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        
    }
    
}
