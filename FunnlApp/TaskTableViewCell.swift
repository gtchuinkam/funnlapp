//
//  TaskTableViewCell.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/9/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    let cellView: UIView = {
        let view = UIView()
        
        return view
    }()
    
    let userImage : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(named: "user-icon")
        
        return imgView
    }()
    
    let taskTitle: UILabel = {
        let label = UILabel()
        label.text = "Meet with Bob"
        label.font = UIFont(name: "Roboto", size: 24)
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView(){
        addSubview(cellView)
        cellView.addSubview(userImage)
        cellView.addSubview(taskTitle)
        self.selectionStyle = .none
        
        //CellView Constraints
        cellView.translatesAutoresizingMaskIntoConstraints = false
        cellView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        cellView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        cellView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5).isActive = true
        
        //UserImage Constraints
        userImage.translatesAutoresizingMaskIntoConstraints = false
        userImage.leadingAnchor.constraint(equalTo: cellView.leadingAnchor).isActive = true
        userImage.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        userImage.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        userImage.widthAnchor.constraint(equalTo: userImage.heightAnchor).isActive = true
        
        //TaskTitle Constraints
        taskTitle.translatesAutoresizingMaskIntoConstraints = false
        taskTitle.leadingAnchor.constraint(equalTo: userImage.trailingAnchor).isActive = true
        taskTitle.topAnchor.constraint(equalTo: cellView.topAnchor).isActive = true
        taskTitle.bottomAnchor.constraint(equalTo: cellView.bottomAnchor).isActive = true
        taskTitle.trailingAnchor.constraint(equalTo: cellView.trailingAnchor).isActive = true
        
    }

}
