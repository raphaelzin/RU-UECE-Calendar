//
//  CalendarViewController.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-08-05.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class CalendarViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var noInternetView: UIView!
    var months:Array<Any>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Utils.light
        tableView.backgroundColor = Utils.light
        tableView.separatorColor = Utils.contentLight
        
        getCalendarJSON()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
        DispatchQueue.main.async(execute: { self.tableView.reloadData() })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell", for: indexPath) as! EventTableViewCell
        
        let events = ((months[indexPath.section] as! NSDictionary).allValues.first as! NSDictionary)["events"]
        let eventDate = ((events as! Array<Any>)[indexPath.row] as! NSDictionary).allKeys.first
        let eventInfo = ((events as! Array<Any>)[indexPath.row] as! NSDictionary).allValues.first
        
        cell.date.text = (eventDate as! String)
        cell.info.text = (eventInfo as! String)
        cell.backgroundColor = .clear
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (months != nil){
            return (((months[section] as! NSDictionary).allValues.first as! NSDictionary)["events"] as! Array<Any>).count
        }else{
            return 0
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return (months != nil) ? months.count : 0
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return (months != nil) ? (months[section] as! NSDictionary).allKeys.first as! String : ""
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let header = view as! UITableViewHeaderFooterView
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 34))
        headerView.backgroundColor = Utils.contentLight
        header.backgroundView = headerView
        
        if let textlabel = header.textLabel {
            textlabel.font = UIFont(name: "AvenirNextCondensed-DemiBold", size: 22)
            textlabel.textColor = .white
            
            textlabel.text = (months != nil) ? (months[section] as! NSDictionary).allKeys.first as! String : ""
        }
    }

    @IBAction func refreshConnection(_ sender: Any) {
        getCalendarJSON()
    }
    
    func getCalendarJSON() {
        let url = URL(string: "https://raw.githubusercontent.com/raphaelzin/RU-UECE-Calendar/master/calendar-data.json")
        
        let task = URLSession.shared.dataTask(with: url!) { data, response, error in
            guard error == nil else{
                print(error!)
                self.tableView.isHidden = true
                return
            }
            guard let data = data else{
                print("Data is empty")
                return
            }
            self.tableView.isHidden = false
            let dic = (try! JSONSerialization.jsonObject(with: (String(data: data, encoding: .utf8)?.data(using: .utf8))!, options: []) as! NSDictionary)
            self.months = dic.value(forKey: "array") as! Array<Any>
            DispatchQueue.main.async(execute: { self.tableView.reloadData() })
        }
        task.resume()
    }
}
