//
//  CompaniesTableViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class CompaniesTableViewController: UITableViewController {
    
    var companiesList : [CompanyData]?
    var contactslist : [ContactData]?
    
    var selectedIndustryId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        //API Data requests
        fetchCompanies()
        fetchContacts()
    }
    
    //MARK: - API Request handlers
    
    func fetchContacts(){
        let urlString = "http://localhost:8000/api/contacts/?format=json"
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let parsedData = self.parseContactJSON(unparsedData: safeData)
                    let finalList = self.filterContacts(contactList: parsedData)
                    self.contactslist = finalList
                }
            }
            task.resume()
        }
    }
    
    func parseContactJSON(unparsedData : Data) -> [ContactData]{
        let decoder = JSONDecoder()
        var contactsList : [ContactData] = []
        
        do{
            let decodedData = try decoder.decode([ContactData].self, from: unparsedData)
            contactsList = decodedData
        }catch{
            print(error)
        }
        
        return contactsList
    }
    
    func filterContacts(contactList : [ContactData]) -> [ContactData]{
        var finalList : [ContactData] = []
        for contact in contactList {
            if contact.industry == self.selectedIndustryId{
                finalList.append(contact)
            }
        }
        
        return finalList
    }
    
    func fetchCompanies(){
        let urlString = "http://localhost:8000/api/companies/?format=json"
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil{
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let parsedData = self.parseCompanyJSON(unparsedData: safeData)
                    let finalCompaniesList = self.filterCompanyData(companyList: parsedData)
                    self.companiesList = finalCompaniesList
                }
            }
            task.resume()
        }
    }
    
    func parseCompanyJSON(unparsedData: Data) -> [CompanyData]{
        let decoder = JSONDecoder()
        var companiesList : [CompanyData] = []
        
        do{
            let decodedData = try decoder.decode([CompanyData].self, from: unparsedData)
            companiesList = decodedData
        }catch{
            print(error)
        }
        
        return companiesList
    }
    
    func filterCompanyData(companyList : [CompanyData]) -> [CompanyData]{
        var finalList : [CompanyData] = []
        for company in companyList {
            if company.industry.contains(self.selectedIndustryId!) {
                finalList.append(company)
                print(company.company_name)
            }
        }
        
        return finalList
    }
}
