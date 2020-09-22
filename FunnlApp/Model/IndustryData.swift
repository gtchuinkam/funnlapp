//
//  IndustryData.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import Foundation

struct IndustryData: Decodable{
    var id: Int
    var industry_name: String
    
    var companies : [CompanyData] = []
    
    private enum CodingKeys: String, CodingKey { case id, industry_name }
    
}

extension IndustryData : Equatable{
    static func == (lhs: IndustryData, rhs: IndustryData) -> Bool {
        return lhs.id == rhs.id && lhs.industry_name == rhs.industry_name
    }
}
