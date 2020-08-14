//
//  CollapsableViewModel.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class CollapsableViewModel {
    let label : String
    let image : UIImage?
    let children : [CollapsableViewModel]
    var isCollapsed: Bool
    
    init(label : String, image: UIImage?, children : [CollapsableViewModel], isCollapsed : Bool = true) {
        self.label = label
        self.image = image
        self.children = children
        self.isCollapsed = isCollapsed
    }
}
