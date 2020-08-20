//
//  ContactHeaderCell.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/18/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class ContactHeaderCell: UITableViewHeaderFooterView {
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "button-subheader-color")
        
        return view
    }()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.textColor = UIColor(named: "background-text-icon-color")
        return label
    }()

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier : reuseIdentifier)
        
        self.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(containerView)
        setContainerViewConstraints()
        
        self.addSubview(titleLabel)
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContainerViewConstraints(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    func setTitleLabelConstraints(){
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
    }
    
    func setTitle(as title: String){
        titleLabel.text = title
        titleLabel.text = titleLabel.text?.uppercased()
    }
    
}
