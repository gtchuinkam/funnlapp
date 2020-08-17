//
//  ContactViewModel.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/16/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import Foundation

struct ContactViewSections {
    var name : String
    var data : [String : String]
    
    init(assignedName: String) {
        self.name = assignedName
        self.data = [:]
    }
}
