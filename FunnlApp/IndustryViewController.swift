//
//  IndustryViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/9/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class IndustryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        setUpNaveBar()
    }
    
    //MARK: - Constraint Functions
    func setUpNaveBar(){
        navigationController?.navigationBar.backgroundColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.barTintColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = false
        
        //Text Styling
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 24)!, .foregroundColor: UIColor(named: "background-text-icon-color")!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        self.title = "Select Industry"
    }

}
