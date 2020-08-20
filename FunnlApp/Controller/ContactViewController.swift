//
//  ContactViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/16/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    
    let bannerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "navbar-header-color")
        
        return view
    }()
    
    let seperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let profileImage : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "person.circle")
        img.contentMode = .scaleAspectFit
        img.tintColor = UIColor(named: "background-text-icon-color")
        return img
    }()
    
    let contactNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Default Name"
        label.font = UIFont(name: "Roboto", size: 100)
        label.textColor = UIColor(named: "background-text-icon-color")
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        label.baselineAdjustment = .alignCenters
        return label
    }()
    
    let tableView : UITableView = {
        let tv  = UITableView(frame: .zero, style: .grouped)
        tv.backgroundColor = UIColor(named: "background-text-icon-color")
        tv.sectionFooterHeight = 0.0
        tv.separatorStyle = .none
        return tv
    }()
    
    var selectedContact : ContactData?
    
    var contactDataModel = ContactViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        navigationController?.navigationBar.shadowImage = UIImage()
        
        print(contactDataModel)
        contactDataModel.setUpSections(for: selectedContact!)
        print(contactDataModel)
        
        view.addSubview(bannerView)
        setBannerViewConstraints()
        
        bannerView.addSubview(seperatorView)
        setSeperatorViewConstraints()
        
        bannerView.addSubview(profileImage)
        setProfileImageConstraints()
        
        bannerView.addSubview(contactNameLabel)
        setContactNameLabelConstraints()
        
        view.addSubview(tableView)
        setTableViewConstraints()
        
        tableView.register(ContactInfoCell.self, forCellReuseIdentifier: "CELLID")
        tableView.register(ContactHeaderCell.self, forHeaderFooterViewReuseIdentifier: "HEADERID")
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func setBannerViewConstraints(){
        bannerView.translatesAutoresizingMaskIntoConstraints = false
        bannerView.topAnchor.constraint(equalTo: (view.safeAreaLayoutGuide.topAnchor)).isActive = true
        bannerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        bannerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        bannerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.125).isActive = true
    }
    
    func setSeperatorViewConstraints(){
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor).isActive = true
        seperatorView.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: bannerView.trailingAnchor).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
    
    func setProfileImageConstraints(){
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.leadingAnchor.constraint(equalTo: bannerView.leadingAnchor, constant: 5).isActive = true
        profileImage.heightAnchor.constraint(equalTo: bannerView.heightAnchor, multiplier: 0.8).isActive = true
        profileImage.centerYAnchor.constraint(equalTo: bannerView.centerYAnchor).isActive = true
        profileImage.widthAnchor.constraint(equalTo: profileImage.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setContactNameLabelConstraints(){
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 10).isActive = true
        contactNameLabel.topAnchor.constraint(equalTo: bannerView.topAnchor).isActive = true
        contactNameLabel.bottomAnchor.constraint(equalTo: bannerView.bottomAnchor).isActive = true
        contactNameLabel.widthAnchor.constraint(equalTo: bannerView.widthAnchor, multiplier: 0.5).isActive = true
        
        let contactName = "\(selectedContact!.first_name) \(selectedContact!.last_name)"
        contactNameLabel.text = contactName
    }
    
    func setTableViewConstraints(){
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: bannerView.bottomAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    }
    
}

extension ContactViewController : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contactDataModel.sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HEADERID") as! ContactHeaderCell
        let sectionTitle = contactDataModel.sections[section].name
        view.setTitle(as: sectionTitle)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactDataModel.sections[section].data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELLID", for: indexPath) as! ContactInfoCell
        let section = indexPath.section
        let row = indexPath.row
        
        let currentSection = contactDataModel.sections[section]
        let currentDictionary = currentSection.data
        
        let intIndex = row
        let index = currentDictionary.index(currentDictionary.startIndex, offsetBy: intIndex)
        
        let keyString = currentDictionary.keys[index]
        let valueString = currentDictionary[keyString] ?? "None"
        
        cell.setText(key: keyString, value: valueString)
        
        return cell
    }
    
}
