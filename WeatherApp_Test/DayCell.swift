//
//  DayCell.swift
//  WeatherApp_Test
//
//  Created by Jasur Rajabov on 2/20/21.
//

import UIKit

class DayCell: UITableViewCell {
    
    let labelDay: UILabel = {
        let label = UILabel()
        label.text = "Day"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let labelTemp: UILabel = {
        let label = UILabel()
        label.text = "0 C"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initViews() {
        
        self.backgroundColor = .clear
        //self.contentView.backgroundColor = .clear
        
        self.contentView.addSubview(labelDay)
        NSLayoutConstraint(item: labelDay, attribute: .left, relatedBy: .equal, toItem: self.contentView, attribute: .left, multiplier: 1, constant: 25).isActive = true
        NSLayoutConstraint(item: labelDay, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        
        self.contentView.addSubview(labelTemp)
        NSLayoutConstraint(item: labelTemp, attribute: .right, relatedBy: .equal, toItem: self.contentView, attribute: .right, multiplier: 1, constant: -40).isActive = true
        NSLayoutConstraint(item: labelTemp, attribute: .centerY, relatedBy: .equal, toItem: self.contentView, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
    }
    
}
