//
//  ContactData.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

struct ContactData : Decodable {
    var id : Int
    var user : Int
    var company : Int
    var industry : Int
    var first_name : String
    var last_name : String
    var priority : Int
    var number_of_contacts : Int
    var most_recent_contact_date : String
    var role : String
    var introduced_by : String
    var company_website : String
    var linkedin : String
    var alma_mater : String
    var notes : String
    var email : String
}
