//
//  DetailsTableViewCell.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-09-03.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class DetailsTableViewCell: UITableViewCell {

    @IBOutlet var keyLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        keyLabel.textColor   = .white
        valueLabel.textColor = .white
        
        backgroundColor = .clear
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

}
