//
//  DashboardViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/8/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    //MARK: - UI Elements Initialization
    
    let cardsContainter: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let scannerContainter: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let tasksContainter: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let buttonContainter: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let contactsCard: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "button-subheader-color")
        button.setImage(UIImage(named: "contacts-card-icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor(named: "background-text-icon-color")
        
        return button
    }()
    
    let tasksCard: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "button-subheader-color")
        button.setImage(UIImage(named: "tasks-card-icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor(named: "background-text-icon-color")
        
        return button
    }()
    
    let logCard: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(named: "button-subheader-color")
        button.setImage(UIImage(named: "log-card-icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.tintColor = UIColor(named: "background-text-icon-color")
        
        return button
    }()
    
    let addButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor(named: "button-subheader-color")
        button.setImage(UIImage(named: "add-circle-icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    let scannerButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "scanner-icon"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFill
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        
        return button
    }()
    
    let tasksLabel: UILabel = {
        let label = UILabel()
        label.text = "Upcoming Tasks"
        label.font = UIFont(name: "Roboto", size: 60)
        label.textColor = UIColor(named: "secondary-text-color")
        
        //Resizing attributes
        label.numberOfLines = 1
        label.minimumScaleFactor = 0.25
        label.sizeToFit()
        label.adjustsFontSizeToFitWidth = true;
        
        return label
    }()
    
    let tasksTable: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = UIColor(named: "background-text-icon-color")
        tableView.separatorStyle = .none
        tableView.alwaysBounceVertical = false
        
        return tableView
    }()
    
    //MARK: - viewDidLoad Function
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        //Cards Container Handlers
        view.addSubview(cardsContainter)
        setCardsContainerConstraints()
        
        //Scanner Container Handlers
        view.addSubview(scannerContainter)
        setScannerContainerConstraints()
        
        //Tasks Container Handlers
        view.addSubview(tasksContainter)
        setTasksContainerConstraints()
        
        //Button Container Handlers
        view.addSubview(buttonContainter)
        setButtonContainerConstraints()
        
        //Contact Card Handlers
        cardsContainter.addSubview(contactsCard)
        setContactsCardContraints()
        
        //Tasks Card Handlers
        cardsContainter.addSubview(tasksCard)
        setTasksCardConstraints()
        
        //Log Card Handlers
        cardsContainter.addSubview(logCard)
        setLogCardConstraints()
        
        //Add Button Handlers
        buttonContainter.addSubview(addButton)
        setAddButtonConstraints()
        
        //Scanner Button Handlers
        scannerContainter.addSubview(scannerButton)
        setScannerButtonConstraints()
        
        //Tasks Label Handlers
        tasksContainter.addSubview(tasksLabel)
        setTasksLabelConstraints()
        
        //Tasks Table Handlers
        tasksContainter.addSubview(tasksTable)
        setTasksTableConstraints()
        
        setUpTableViewProtocols()
        
        setUpIBActions()
        
        setUpNavBar()
        
    }

    //MARK: - Constraint Functions

    func setUpNavBar(){
        
        //Background Styling
        navigationController?.navigationBar.barTintColor = UIColor(named: "navbar-header-color")
        navigationController?.navigationBar.isTranslucent = false
        
        //Text Styling
        let attributes = [NSAttributedString.Key.font: UIFont(name: "Roboto", size: 24)!, .foregroundColor: UIColor(named: "background-text-icon-color")!]
        UINavigationBar.appearance().titleTextAttributes = attributes
        self.title = "Dashboard"
        
        //Button styling
        let addButton = UIButton(type: .system)
        addButton.setImage(UIImage(named: "add-icon"), for: .normal)
        addButton.tintColor = UIColor(named: "background-text-icon-color")
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        
    }
    
    func setCardsContainerConstraints(){
        cardsContainter.translatesAutoresizingMaskIntoConstraints = false
        cardsContainter.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        cardsContainter.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        cardsContainter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        cardsContainter.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.225).isActive = true
        
    }
    
    func setScannerContainerConstraints(){
        scannerContainter.translatesAutoresizingMaskIntoConstraints = false
        scannerContainter.topAnchor.constraint(equalTo: cardsContainter.bottomAnchor).isActive = true
        scannerContainter.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        scannerContainter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        scannerContainter.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.15).isActive = true
    }
    
    func setTasksContainerConstraints(){
        tasksContainter.translatesAutoresizingMaskIntoConstraints = false
        tasksContainter.topAnchor.constraint(equalTo: scannerContainter.bottomAnchor).isActive = true
        tasksContainter.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        tasksContainter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        tasksContainter.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.5).isActive = true
    }
    
    func setButtonContainerConstraints(){
        buttonContainter.translatesAutoresizingMaskIntoConstraints = false
        buttonContainter.topAnchor.constraint(equalTo: tasksContainter.bottomAnchor).isActive = true
        buttonContainter.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        buttonContainter.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        buttonContainter.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func setContactsCardContraints(){
        contactsCard.translatesAutoresizingMaskIntoConstraints = false
        contactsCard.leadingAnchor.constraint(equalTo: cardsContainter.leadingAnchor).isActive = true
        contactsCard.widthAnchor.constraint(equalTo: cardsContainter.widthAnchor, multiplier: 0.325).isActive = true
        contactsCard.centerYAnchor.constraint(equalTo: cardsContainter.centerYAnchor).isActive = true
        contactsCard.heightAnchor.constraint(equalTo: cardsContainter.heightAnchor, multiplier: 0.90).isActive = true
    }
    
    func setTasksCardConstraints(){
        tasksCard.translatesAutoresizingMaskIntoConstraints = false
        tasksCard.centerYAnchor.constraint(equalTo: cardsContainter.centerYAnchor).isActive = true
        tasksCard.centerXAnchor.constraint(equalTo: cardsContainter.centerXAnchor).isActive = true
        tasksCard.heightAnchor.constraint(equalTo: cardsContainter.heightAnchor, multiplier: 0.90).isActive = true
        tasksCard.widthAnchor.constraint(equalTo: contactsCard.widthAnchor).isActive = true
    }
    
    func setLogCardConstraints(){
        logCard.translatesAutoresizingMaskIntoConstraints = false
        logCard.trailingAnchor.constraint(equalTo: cardsContainter.trailingAnchor).isActive = true
        logCard.widthAnchor.constraint(equalTo: contactsCard.widthAnchor).isActive = true
        logCard.centerYAnchor.constraint(equalTo: cardsContainter.centerYAnchor).isActive = true
        logCard.heightAnchor.constraint(equalTo: cardsContainter.heightAnchor, multiplier: 0.90).isActive = true
    }
    
    func setAddButtonConstraints(){
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.bottomAnchor.constraint(equalTo: buttonContainter.bottomAnchor, constant: -10).isActive = true
        addButton.topAnchor.constraint(equalTo: buttonContainter.topAnchor, constant: 5).isActive = true
        addButton.centerXAnchor.constraint(equalTo: buttonContainter.centerXAnchor).isActive = true
        addButton.widthAnchor.constraint(equalTo: addButton.heightAnchor).isActive = true
    }
    
    func setScannerButtonConstraints(){
        scannerButton.translatesAutoresizingMaskIntoConstraints = false
        scannerButton.topAnchor.constraint(equalTo: scannerContainter.topAnchor).isActive = true
        scannerButton.bottomAnchor.constraint(equalTo: scannerContainter.bottomAnchor, constant: -5).isActive = true
        scannerButton.leadingAnchor.constraint(equalTo: scannerContainter.leadingAnchor).isActive = true
        scannerButton.trailingAnchor.constraint(equalTo: scannerContainter.trailingAnchor).isActive = true
    }
    
    func setTasksLabelConstraints(){
        tasksLabel.translatesAutoresizingMaskIntoConstraints = false
        tasksLabel.topAnchor.constraint(equalTo: tasksContainter.topAnchor).isActive = true
        tasksLabel.leadingAnchor.constraint(equalTo: tasksContainter.leadingAnchor).isActive = true
        tasksLabel.heightAnchor.constraint(equalTo: tasksContainter.heightAnchor, multiplier: 0.175).isActive = true
        tasksLabel.widthAnchor.constraint(equalTo: tasksContainter.widthAnchor, multiplier: 0.75).isActive = true
    }
    
    func setTasksTableConstraints(){
        tasksTable.translatesAutoresizingMaskIntoConstraints = false
        tasksTable.topAnchor.constraint(equalTo: tasksLabel.bottomAnchor , constant: 10).isActive = true
        tasksTable.bottomAnchor.constraint(equalTo: tasksContainter.bottomAnchor, constant:  -10).isActive = true
        tasksTable.leadingAnchor.constraint(equalTo: tasksContainter.leadingAnchor).isActive = true
        tasksTable.trailingAnchor.constraint(equalTo: tasksContainter.trailingAnchor).isActive = true
    }
    
    //MARK: - TableView Functions
    func setUpTableViewProtocols(){
        tasksTable.delegate = self
        tasksTable.dataSource = self
        tasksTable.register(TaskTableViewCell.self, forCellReuseIdentifier: "cellId")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tasksTable.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! TaskTableViewCell
        cell.backgroundColor = UIColor(named: "background-text-icon-color")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableHeight = tasksTable.frame.height
        let cellHeight = tableHeight / CGFloat(4)

        return cellHeight

    }
    
    //MARK: - Segue Functions
    @objc func contactsButtonClicked(sender: UIButton){
        self.tabBarController?.selectedIndex = 1
    }
    
    func setUpIBActions(){
        contactsCard.addTarget(self, action: #selector(self.contactsButtonClicked(sender:)), for: .touchUpInside)
    }
    
    
}
