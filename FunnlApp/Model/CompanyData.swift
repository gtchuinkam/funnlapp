//
//  CompanyData.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import Foundation

class CompanyData : Decodable {
    var id : Int
    var company_name : String
    
    var contacts : [ContactData] = []
    var collapsed : Bool = false
    
    private enum CodingKeys: String, CodingKey { case id, company_name }
    
}

extension CompanyData : Equatable{
    static func == (lhs: CompanyData, rhs: CompanyData) -> Bool {
        return lhs.id == rhs.id && lhs.company_name == rhs.company_name
    }
    
    
}
