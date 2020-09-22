//
//  DataManager.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/21/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

protocol DataManagerDelegate {
    func didUpdateContacts(contactList : [ContactData])
    func didUpdateCompanies(companyList: [CompanyData])
    func didUpdateIndustries(industryList: [IndustryData])
    func didFailWithError(error : Error)
}

struct DataManager {
    
    var delegate : DataManagerDelegate?
    
    let CONTACTURL = "http://127.0.0.1:8000/api/contacts/?format=json"
    let COMPANYURL = "http://127.0.0.1:8000/api/companies/?format=json"
    let INDUSTRYURL = "http://127.0.0.1:8000/api/industries/?format=json"
    
    //MARK: - API Requests
    func fetchContactData(){
        if let url = URL(string: CONTACTURL){
            let session = URLSession(configuration: .default)
            let group  = DispatchGroup()
            group.enter()
            
            session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let contactList = self.parseContactData(safeData){
                        self.delegate?.didUpdateContacts(contactList: contactList)
                        group.leave()
                    }
                }
            }.resume()
            group.wait()
        }
    }
    
    func parseContactData(_ contactData : Data) -> [ContactData]?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([ContactData].self, from: contactData)
            return decodedData
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func fetchCompanyData(){
        if let url = URL(string: COMPANYURL){
            let session = URLSession(configuration: .default)
            let group  = DispatchGroup()
            group.enter()
            session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let companyList = self.parseCompanyData(safeData){
                        self.delegate?.didUpdateCompanies(companyList: companyList)
                        group.leave()
                    }
                }
            }.resume()
            group.wait()
        }
    }
    
    func parseCompanyData(_ companyData : Data) -> [CompanyData]?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([CompanyData].self, from: companyData)
            return decodedData
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
    func fetchIndustryData(){
        if let url = URL(string: INDUSTRYURL){
            let session = URLSession(configuration: .default)
            let group  = DispatchGroup()
            group.enter()
            session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                }
                if let safeData = data {
                    if let industryList = self.parseIndustryData(safeData){
                        self.delegate?.didUpdateIndustries(industryList: industryList)
                        group.leave()
                    }
                }
            }.resume()
            group.wait()
        }
    }
    
    func parseIndustryData(_ industryData : Data) -> [IndustryData]?{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([IndustryData].self, from: industryData)
            return decodedData
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
    
}
