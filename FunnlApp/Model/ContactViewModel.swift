//
//  ContactViewModel.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/16/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import Foundation

struct ContactViewModel {
    
    var sections : [ContactViewSections]
    
    init() {
        sections = []
    }
    
    mutating func setUpSections(for contact : ContactData){
        //Contact Information Section
        var contactInformationSection = ContactViewSections(assignedName: "Contact Information")
        let priorityString : String = {
            if contact.priority == 0{
                return "LOW"
            }else {
                return "HIGH"
            }
        }()
        
        contactInformationSection.data["Priority"] = priorityString
        contactInformationSection.data["Role"] = contact.role
        contactInformationSection.data["Name"] = "\(contact.first_name) \(contact.last_name)"
        contactInformationSection.data["Alma Mater"] = contact.alma_mater
        sections.append(contactInformationSection)
        
        //Communication Section
        var communicationSection = ContactViewSections(assignedName: "Communication")
        
        communicationSection.data["Email"] = contact.email
        communicationSection.data["LinkedIn"] = contact.linkedin
        communicationSection.data["Company Website"] = contact.company_website
        sections.append(communicationSection)
        
        var historySection = ContactViewSections(assignedName: "History")
        
        historySection.data["Last Contact Date"] = contact.most_recent_contact_date ?? "None"
        historySection.data["Introduced By"] = contact.introduced_by
        sections.append(historySection)
    }
    
}
