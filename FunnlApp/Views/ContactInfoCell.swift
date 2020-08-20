//
//  ContactInfoCell.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/18/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class ContactInfoCell: UITableViewCell {
    
    let dividerView : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    
    let leftLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 18)
        label.text = "Sample Data:"
        return label
    }()
    
    let rightLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 18)
        label.text = "Sample Value"
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
        backgroundColor = UIColor(named: "background-text-icon-color")
        
        addSubview(dividerView)
        setDividerViewConstraints()
        
        addSubview(leftLabel)
        setLeftLabelConstraints()
        
        addSubview(rightLabel)
        setRightLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setDividerViewConstraints(){
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dividerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        dividerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        dividerView.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    func setLeftLabelConstraints(){
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        leftLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        leftLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        leftLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setRightLabelConstraints(){
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        rightLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 1).isActive = true
        rightLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
    }
    
    func setText(key : String, value: String){
        leftLabel.text = key
        rightLabel.text = value
    }
    
}
