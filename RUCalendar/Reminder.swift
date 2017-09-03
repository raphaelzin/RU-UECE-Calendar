//
//  Reminder.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-09-03.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import Foundation
import RealmSwift

class Reminder: Object {
    dynamic var id = UUID().uuidString
    dynamic var title = ""
    dynamic var details = ""
    dynamic var dueDate = Date()
    dynamic var remindAt = Date()
    // Exam, Presentation or Assignment
    dynamic var category = 0
    
    convenience init(title: String, details: String, dueDate: Date, remindAt: Date, category: Int) {
        self.init()
        self.title    = title
        self.details  = details
        self.dueDate  = dueDate
        self.remindAt = remindAt
        self.category = category
    }
}
