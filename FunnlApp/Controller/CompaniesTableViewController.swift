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
    
    var selectedIndustryId : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemTeal
        fetchCompanies()
    }
    
    //MARK: - API Request handlers
    
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
                    let parsedData = self.parseJSON(unparsedData: safeData)
                    let finalCompaniesList = self.filterCompanyData(companyList: parsedData)
                    self.companiesList = finalCompaniesList
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(unparsedData: Data) -> [CompanyData]{
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
