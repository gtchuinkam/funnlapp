//
//  CompanyData.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import Foundation

struct CompanyData : Decodable {
    var id : Int
    var user : Int
    var industry : [Int]
    var company_name : String
}
