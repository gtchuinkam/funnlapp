//
//  CompanyContactCell.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/18/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class CompanyContactCell: UITableViewCell {
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        view.layer.cornerRadius = 5
        return view
    }()
    
    let profileImageView : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "user-icon")
        return imgView
    }()
    
    let contactNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 18)
        label.textColor = UIColor(named: "secondary-text-color")
        label.text = "John Doe"
        return label
    }()
    
    let seperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "button-subheader-color")
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor(named: "secondary-text-color")
        self.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        addSubview(containerView)
        setContainerViewConstraints()
        
        containerView.addSubview(profileImageView)
        setProfileImageViewConstraints()
        
        containerView.addSubview(contactNameLabel)
        setContactNameLabel()
        
        containerView.addSubview(seperatorView)
        setSeperatorViewCOnstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContainerViewConstraints(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.9).isActive = true
    }
    
    func setProfileImageViewConstraints(){
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        profileImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 5).isActive = true
        profileImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2).isActive = true
        profileImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2).isActive = true
        profileImageView.widthAnchor.constraint(equalTo: profileImageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setContactNameLabel(){
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.leadingAnchor.constraint(equalTo: profileImageView.trailingAnchor, constant: 5).isActive = true
        contactNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setSeperatorViewCOnstraints(){
        seperatorView.translatesAutoresizingMaskIntoConstraints = false
        seperatorView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        seperatorView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        seperatorView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        seperatorView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
}
