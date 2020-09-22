//
//  CreateContactController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/23/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class CreateContactController: UIViewController{
    
    var companiesList : [CompanyData]?
    var contactList: [ContactData]?
    var industryList: [IndustryData]?
    
    var referenceList : [IndustryData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        setUpNavBar()
    }

    //MARK: - SetUp Functions
    
    func setUpNavBar(){
        self.navigationController?.navigationBar.barTintColor = UIColor(named: "navbar-header-color")
        self.navigationController?.navigationBar.isTranslucent = false
    }

}
