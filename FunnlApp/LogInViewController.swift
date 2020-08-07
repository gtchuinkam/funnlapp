//
//  LogInViewController.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/6/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let topContainerView: UIView = {
        let view  = UIView()
        
        return view
    }()
    
    let backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back-arrow.png"), for: .normal)
        
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.font = UIFont(name: "Roboto", size: 100)
        label.textColor = UIColor(named: "secondary-text-color")
        
        //Resizing attributes
        label.numberOfLines = 0
        label.minimumScaleFactor = 0.25
        label.adjustsFontSizeToFitWidth = true;
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        
        //Top Container handlers
        view.addSubview(topContainerView)
        setTopContainerViewConstraints()
        
        //Back Button handlers
        topContainerView.addSubview(backButton)
        setBackButtonConstraints()
        
        //Title Label Handlers
        topContainerView.addSubview(titleLabel)
        setTitleLabelConstraints()
        
    }
    
    func setTopContainerViewConstraints(){
        topContainerView.translatesAutoresizingMaskIntoConstraints = false
        topContainerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        topContainerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        topContainerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20).isActive = true
        topContainerView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.25).isActive = true
    }
    
    func setBackButtonConstraints(){
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.topAnchor.constraint(equalTo: topContainerView.topAnchor, constant: 40).isActive = true
        backButton.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        backButton.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.3).isActive = true
        backButton.widthAnchor.constraint(equalTo: backButton.heightAnchor).isActive = true
    }
    
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.bottomAnchor.constraint(equalTo: topContainerView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: topContainerView.leadingAnchor).isActive = true
        titleLabel.widthAnchor.constraint(equalTo: topContainerView.widthAnchor, multiplier: 0.5).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: topContainerView.heightAnchor, multiplier: 0.33).isActive = true
    }

}
