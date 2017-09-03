//
//  Utils.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-07-28.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import Foundation
import UIKit

class Utils: NSObject {
    static let dark = UIColor(colorLiteralRed: 36/255, green: 40/255, blue: 49/255, alpha: 1)
    static let light  = UIColor(colorLiteralRed: 58/255, green: 64/255, blue: 75/255, alpha: 1)
    static let contentLight = UIColor(colorLiteralRed: 254/255, green: 72/255, blue: 71/255, alpha: 1)
    
    static func formatedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE, d' de 'MMMM"
        
        return formatter.string(from: date)
    }
    
    static func shortFormat(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E d - MMM"
    
        return formatter.string(from: date)
    }
}
