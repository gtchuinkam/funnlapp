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
    var contactList: [ContactData]?
    var industryList: [IndustryData]?
    
    var referenceList : [IndustryData] = []
    
    var selectedIndustryIndex : Int?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        setUpTableView()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addContactButtonTapped))
        
    }
    
   
    //MARK: - Table View Functions
    
    func setUpTableView(){
        tableView.separatorStyle = .none
        tableView.register(CompanyContactCell.self, forCellReuseIdentifier: "CELLID")
        tableView.register(CompanyHeaderCell.self, forHeaderFooterViewReuseIdentifier: "HEADERID")
    }
    
    //Sections and Rows
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !referenceList[selectedIndustryIndex!].companies[section].collapsed{
            return 0
        }
        return referenceList[selectedIndustryIndex!].companies[section].contacts.count
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return referenceList[selectedIndustryIndex!].companies.count
    }
    
    //Cell Configuration
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELLID", for: indexPath) as! CompanyContactCell
        let section  = indexPath.section
        let row  = indexPath.row
        
        let contactObject = referenceList[selectedIndustryIndex!].companies[section].contacts[row]
        let contactName = "\(contactObject.first_name) \(contactObject.last_name)"
        
        cell.contactNameLabel.text = contactName
        return cell
    }
    
    //Header Configuration
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let gesture:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.openSection(_:)))
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HEADERID") as! CompanyHeaderCell
        let companyName = referenceList[selectedIndustryIndex!].companies[section].company_name
        let companyFirstLetter = companyName.first!
        let contactCount  = referenceList[selectedIndustryIndex!].companies[section].contacts.count
        view.tag = section
        view.setUpView(companyName: companyName, imageCharacter: companyFirstLetter, contactCount: contactCount)
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(gesture)
        
        return view
        
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(self.view.bounds.height / 12.5)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section
        let row = indexPath.row
        
        let selectedContact = referenceList[selectedIndustryIndex!].companies[section].contacts[row]
        let contactVC = ContactViewController()
        contactVC.selectedContact = selectedContact
        self.navigationController?.pushViewController(contactVC, animated: false)
    }
    
    @objc func openSection(_ sender: UITapGestureRecognizer){
        let section = sender.view!.tag
        let myHeader = tableView.headerView(forSection: section) as! CompanyHeaderCell as CompanyHeaderCell
        myHeader.arrowImage.image = UIImage(named: "arrow-down.pdf")

        var indexPaths = [IndexPath]()
        let selectedCompany = referenceList[selectedIndustryIndex!].companies

        for row in selectedCompany[section].contacts.indices {
            let indexPathToDelete = IndexPath(row: row, section: section)
            indexPaths.append(indexPathToDelete)
        }

        let isCollapsed = selectedCompany[section].collapsed
        selectedCompany[section].collapsed = !isCollapsed

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
    
    @objc func addContactButtonTapped(){
        let newVC = CreateContactController()
        let navController = UINavigationController(rootViewController: newVC)
        newVC.modalPresentationStyle = .automatic
        newVC.title = "Create Contact"
        newVC.companiesList = self.companiesList
        newVC.contactList = self.contactList
        newVC.industryList = self.industryList
        newVC.referenceList = self.referenceList
        self.present(navController, animated: true, completion: nil)
    }
    
}
