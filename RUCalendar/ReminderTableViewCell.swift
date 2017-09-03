//
//  ReminderTableViewCell.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-09-03.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class ReminderTableViewCell: UITableViewCell {

    @IBOutlet var categoryImage: UIImageView!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var monthLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        dayLabel.textColor   = .white
        monthLabel.textColor = .white
        titleLabel.textColor = .white
        backgroundColor      = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
