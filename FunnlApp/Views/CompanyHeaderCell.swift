//
//  CompanyHeaderCell.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/18/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class CompanyHeaderCell: UITableViewHeaderFooterView {
    
    var contactNumberImage : String?
    
    let seperatorView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        return view
    }()
    
    let containerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "button-subheader-color")
        return view
    }()
    
    let imageView : UIImageView = {
        let imgView  = UIImageView()
        imgView.image = UIImage(named: "user-icon")
        
        return imgView
    }()
    
    let dividerView : UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "background-text-icon-color")
        return view
    }()
    
    let companyNameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 20)
        label.textColor = UIColor(named: "background-text-icon-color")
        label.text  = "Sample Company"
        return label
    }()
    
    let arrowImage : UIImageView = {
        let imgview = UIImageView()
        imgview.image = UIImage(named: "arrow-right.pdf")
        return imgview
    }()
    
    let numberImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "00.pdf")
        return imgView
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier : reuseIdentifier)
        self.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addSubview(containerView)
        setContainerViewConstraints()
        
        containerView.addSubview(imageView)
        setImageViewConstraints()
        
        containerView.addSubview(dividerView)
        setDividerViewConstraints()
        
        containerView.addSubview(companyNameLabel)
        setCompanyNameLabelConstraints()
        
        containerView.addSubview(arrowImage)
        setArrowImageConstraints()
        
        containerView.addSubview(numberImage)
        setNumberImageConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setContainerViewConstraints(){
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    func setImageViewConstraints(){
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5).isActive = true
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.5).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2.5).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setDividerViewConstraints(){
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 5).isActive = true
        dividerView.topAnchor.constraint(equalTo: self.topAnchor, constant: 2.5).isActive = true
        dividerView.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: -2.5).isActive = true
        dividerView.widthAnchor.constraint(equalToConstant: 0.5).isActive = true
    }
    
    func setCompanyNameLabelConstraints(){
        companyNameLabel.translatesAutoresizingMaskIntoConstraints = false
        companyNameLabel.leadingAnchor.constraint(equalTo: dividerView.trailingAnchor, constant: 10).isActive = true
        companyNameLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -5).isActive = true
    }
    
    func setArrowImageConstraints(){
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2.5).isActive = true
        arrowImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        arrowImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2.5).isActive = true
        arrowImage.widthAnchor.constraint(equalTo: arrowImage.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setNumberImageConstraints(){
        numberImage.translatesAutoresizingMaskIntoConstraints = false
        numberImage.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 3.5).isActive = true
        numberImage.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -3.5).isActive = true
        numberImage.trailingAnchor.constraint(equalTo: arrowImage.leadingAnchor, constant: 5).isActive = true
        numberImage.widthAnchor.constraint(equalTo: numberImage.heightAnchor, multiplier: 1).isActive = true
    }
    
    func setUpView(companyName: String, imageCharacter: Character, contactCount : Int){
        companyNameLabel.text = companyName
        
        let char = imageCharacter.lowercased()
        let characterImageString = "\(char).pdf"
        imageView.image = UIImage(named: characterImageString)
        
        let numberImageString = "\(contactCount).pdf"
        self.contactNumberImage = numberImageString
        numberImage.image = UIImage(named: numberImageString)
    }
    
}
