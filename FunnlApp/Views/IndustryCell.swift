//
//  IndusryCell.swift
//  FunnlApp
//
//  Created by Germain Brachelt Tchuinkam Tchuinkam on 8/13/20.
//  Copyright © 2020 Germain Brachelt Tchuinkam Tchuinkam. All rights reserved.
//

import UIKit

class IndustryCell: UICollectionViewCell {
    var labelView: UILabel = {
       let label = UILabel()
        label.font = UIFont(name: "Roboto", size: 24)
        label.text = "Sample Cell"
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        
        setUpLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLabel(){
        self.addSubview(labelView)
        
        labelView.translatesAutoresizingMaskIntoConstraints = false
        labelView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        labelView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        labelView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        labelView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}
