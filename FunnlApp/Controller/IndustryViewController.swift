//
//  IndustryViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/9/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class IndustryViewController: UIViewController {
    var industriesList : [IndustryData]?
    var companiesList : [CompanyData]?
    var contactList : [ContactData]?
    
    var referenceList : [IndustryData] = []
    
    
    let collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(IndustryCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = UIColor(named: "background-text-icon-color")
        
        return cv
    }()
    
    var dataManager = DataManager()
    
//MARK: - ViewDidLoad Function
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        dataManager.delegate = self
        
        dataManager.fetchCompanyData()
        dataManager.fetchContactData()
        dataManager.fetchIndustryData()
        
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        setUpNavBar()
        
        view.addSubview(collectionView)
        setCollectionViewConstraints()
        
    }
    
    //MARK: - Constraint Functions
    func setUpNavBar(){
        navigationController?.navigationBar.backgroundColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.barTintColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.prefersLargeTitles = false
        
        //Text Styling
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 24)!, .foregroundColor: UIColor(named: "background-text-icon-color")!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        self.title = "Select Industry"
    }
    
    func setCollectionViewConstraints(){
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
    func createReferenceList(){
        for contact in self.contactList! {
            let contactIndustry : IndustryData? = {
                for industry in industriesList!{
                    if industry.id == contact.industry {
                        return industry
                    }
                }
                return nil
            }()
            let contactCompany : CompanyData? = {
                for company in companiesList!{
                    if company.id == contact.company{
                        return company
                    }
                }
                return nil
            }()
            
            if referenceList.contains(contactIndustry!) == false {
                referenceList.append(contactIndustry!)
            }
            
            let industryIndex = referenceList.firstIndex(of: contactIndustry!)!
            if (referenceList[industryIndex].companies.contains(contactCompany!) == false){
                referenceList[industryIndex].companies.append(contactCompany!)
            }
            
            let companyIndex = referenceList[industryIndex].companies.firstIndex(of: contactCompany!)!
            referenceList[industryIndex].companies[companyIndex].contacts.append(contact)
            
        }
    }
    
}


//MARK: - Colction View Protocols
extension IndustryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return referenceList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IndustryCell
        cell.backgroundColor = .white
        let row = indexPath.row
        cell.labelView.text = referenceList[row].industry_name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(collectionView.bounds.width-30)/2, height: collectionView.bounds.height/3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC = CompaniesTableViewController()
        newVC.title = industriesList![indexPath.row].industry_name
        newVC.selectedIndustryIndex = indexPath.row
        newVC.companiesList = self.companiesList
        newVC.contactList = self.contactList
        newVC.industryList = self.industriesList
        newVC.referenceList = self.referenceList
        newVC.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
}

//MARK: - DataManager Delegate Functions
extension IndustryViewController: DataManagerDelegate{
    func didUpdateContacts(contactList: [ContactData]) {
        DispatchQueue.main.async{
            self.contactList = contactList
        }
    }
    
    func didUpdateCompanies(companyList: [CompanyData]) {
        DispatchQueue.main.async{
            self.companiesList = companyList
        }
    }
    
    func didUpdateIndustries(industryList: [IndustryData]) {
        DispatchQueue.main.async{
            self.industriesList = industryList
            self.collectionView.reloadData()
            self.createReferenceList()
            print(self.referenceList)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
    
}
