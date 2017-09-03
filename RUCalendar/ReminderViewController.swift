//
//  ReminderViewController.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-09-03.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class ReminderViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    var reminderDAO: ReminderDAO!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderDAO = ReminderDAO()
        view.backgroundColor = Utils.light
        tableView.backgroundColor = Utils.light
        tableView.separatorColor = Utils.contentLight
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = Utils.dark
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        title = "Agenda"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "details", sender: reminderDAO.getReminders()[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "details" {
            let details = segue.destination as! DetailsViewController
            details.reminder = sender as! Reminder
        }
    }
    
}

// MARK: - Data source Methods
extension ReminderViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reminderCell", for: indexPath) as! ReminderTableViewCell
        let reminder = reminderDAO.getReminders()[indexPath.row]
        
        cell.titleLabel.text = reminder.title
    
        
        return cell
    }
}


// MARK - Delegate Methods
extension ReminderViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reminderDAO.getReminders().count
    }
}
