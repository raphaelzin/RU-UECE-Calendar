//
//  DetailsViewController.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-09-03.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var reminder:Reminder!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var dueDateLabel: UILabel!
    @IBOutlet var countDownLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Lembrete"
        titleLabel.text = reminder.title
        setupView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func setupView() {
        dueDateLabel.text   = Utils.formatedDate(date: reminder.dueDate)
        tableView.backgroundColor = Utils.light
        tableView.separatorColor = Utils.contentLight
        tableView.tableFooterView = UIView(frame: CGRect.zero)
    }
}

extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
}

extension DetailsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "detailsCell", for: indexPath) as! DetailsTableViewCell
        
        switch indexPath.row {
//        case 0:
//            cell.keyLabel.text   = "Título"
//            cell.valueLabel.text = reminder.title
        case 0:
            cell.keyLabel.text   = "Detalhes"
            cell.valueLabel.text = reminder.details
        case 1:
            cell.keyLabel.text   = "Me notifique em"
            cell.valueLabel.text = Utils.shortFormat(date: reminder.remindAt)
        case 2:
            cell.keyLabel.text   = "Categoria"
            cell.valueLabel.text = "\(reminder.category)"
        
        default:
            print("We shouldn't be here")
        }
        
        
        return cell
    }
}
