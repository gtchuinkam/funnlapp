//
//  CompaniesTableViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class CompaniesTableViewController: UITableViewController {
    
    let companiesURL = "http://localhost:8000/api/companies/?format=json"
    let contactsURL = "http://localhost:8000/api/contacts/?format=json"
    
    var companiesList : [CompanyData] = []
    var contactList: [ContactData] = []
    
    var selectedIndustryId : Int?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        fetchCompanies(urlString: companiesURL) { (returnedList) in
            self.companiesList = [CompanyData]()
            self.companiesList = returnedList
        }
        
        fetchContacts(urlString: contactsURL) { (returnedList) in
            self.contactList = [ContactData]()
            self.contactList = returnedList
        }
        
        assignContacts()
        
        setUpTableView()
        
    }
    
    //MARK: - Company API Request and Filter Functions
    
    func fetchCompanies(urlString : String, completionHandler : @escaping ([CompanyData]) -> ()){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let group  = DispatchGroup()
            
            group.enter()
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
                    let parsedCompanyList = self.parseCompanyJSON(companyData: safeData)
                    let sortedCompanyList = self.filterCompanyList(list: parsedCompanyList)
                    completionHandler(sortedCompanyList)
                    group.leave()
                }
            }
            
            task.resume()
            group.wait()
        }
    }
    
    func parseCompanyJSON(companyData : Data) -> [CompanyData]{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([CompanyData].self, from: companyData)
            return decodedData
        }catch {
            print(error)
            return []
        }
    }
    
    func filterCompanyList(list : [CompanyData]) -> [CompanyData]{
        var finalList: [CompanyData] = []
        
        for company in list{
            if company.industry.contains(selectedIndustryId!){
                finalList.append(company)
            }
        }
        
        return finalList
    }
    
    //MARK: - Contacts API Requests and Filter Functions
    
    func fetchContacts(urlString: String, completionHandler: @escaping ([ContactData]) -> ()){
        if let url = URL(string: urlString){
            let session = URLSession(configuration: .default)
            let group  = DispatchGroup()
            
            group.enter()
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
                    let parsedCompanyList = self.parseContactJSON(contactData: safeData)
                    completionHandler(parsedCompanyList)
                    group.leave()
                }
            }
            
            task.resume()
            group.wait()
        }
    }
    
    func parseContactJSON(contactData : Data) -> [ContactData]{
        let decoder = JSONDecoder()
        do{
            let decodedData = try decoder.decode([ContactData].self, from: contactData)
            return decodedData
        }catch {
            print(error)
            return []
        }
    }
    
    //MARK: - Data Manipulation Functions
    
    func filterContactListByIndustry(list : [ContactData]) -> [ContactData] {
        var filteredList : [ContactData] = []
        for contact in list{
            if contact.industry == selectedIndustryId {
                filteredList.append(contact)
            }
        }
        return filteredList
    }
    
    func assignContacts(){
        contactList = filterContactListByIndustry(list: self.contactList)
        
        if companiesList.count > 0 {
            for n in 0...(companiesList.count - 1) {
                if contactList.count > 0 {
                    for k in 0...(contactList.count - 1){
                        if companiesList[n].id == contactList[k].company{
                            companiesList[n].addContact(contact: contactList[k])
                        }
                    }
                }
            }
        }
    }
    
    //MARK: - Table View Functions
    
    func setUpTableView(){
        tableView.separatorStyle = .none
        tableView.register(CompanyContactCell.self, forCellReuseIdentifier: "CELLID")
        tableView.register(CompanyHeaderCell.self, forHeaderFooterViewReuseIdentifier: "HEADERID")
    }
    
    //Sections and Rows
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if companiesList[section].collapsed == false{
            return 0
        }
        return companiesList[section].contacts.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return companiesList.count
    }
    
    //Cell Configuration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELLID", for: indexPath) as! CompanyContactCell
        let section  = indexPath.section
        let contact = companiesList[section].contacts[indexPath.row]
//        cell.textLabel?.text = "\(contact.first_name) \(contact.last_name)"
        
        return cell
    }
    
    //Header Configuration
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.openSection(_:)))
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HEADERID") as! CompanyHeaderCell
        let companyName = companiesList[section].company_name
        let companyFirstLetter = companyName.first!
        let contactCount  = companiesList[section].contacts.count
        view.tag = section
        view.setUpView(companyName: companyName, imageCharacter: companyFirstLetter, contactCount: contactCount)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
        
        return view
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        let selectedContact = companiesList[section].contacts[row]
        let contactVC = ContactViewController()
        contactVC.selectedContact = selectedContact
        self.navigationController?.pushViewController(contactVC, animated: false)
    }
    
    @objc func openSection(_ sender: UITapGestureRecognizer){
        let section = sender.view!.tag
        let myHeader = tableView.headerView(forSection: section) as! CompanyHeaderCell as CompanyHeaderCell
        myHeader.arrowImage.image = UIImage(named: "arrow-down.pdf")
        var indexPaths = [IndexPath]()
        for row in companiesList[section].contacts.indices {
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPaths.append(indexPathToDelete)
        }

        let isCollapsed = companiesList[section].collapsed
        companiesList[section].collapsed = !isCollapsed

        if isCollapsed {
            tableView.deleteRows(at: indexPaths, with: .fade)
            myHeader.arrowImage.image = UIImage(named: "arrow-right.pdf")
            myHeader.numberImage.image = UIImage(named: myHeader.contactNumberImage!)
        }else{
            tableView.insertRows(at: indexPaths, with: .fade)
            myHeader.arrowImage.image = UIImage(named: "arrow-down.pdf")
            myHeader.numberImage.image = UIImage()
        }
        
    }
    
}
