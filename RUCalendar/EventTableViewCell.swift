//
//  EventTableViewCell.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-08-06.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    @IBOutlet var date: UILabel!
    @IBOutlet var info: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
