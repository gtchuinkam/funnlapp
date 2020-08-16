//
//  ContactCollectionViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/16/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class ContactViewController: UICollectionViewController {
    
    var selectedContact : ContactData?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .blue
        
        
    }
    
}
