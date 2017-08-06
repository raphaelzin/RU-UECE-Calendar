//
//  ViewController.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-07-24.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var monday: UIButton!
    @IBOutlet var tuesday: UIButton!
    @IBOutlet var wednesday: UIButton!
    @IBOutlet var thursday: UIButton!
    @IBOutlet var friday: UIButton!
    var weekdays:[UIButton]!
    
    @IBOutlet var menuHeader: UILabel!
    @IBOutlet var menuBody: UITextView!
    
    @IBOutlet var extrasHeader: UILabel!
    @IBOutlet var extrasBody: UITextView!
    
    @IBOutlet var noInternetView: UIView!
    
    let dark = UIColor(colorLiteralRed: 36/255, green: 40/255, blue: 49/255, alpha: 1)
    let light  = UIColor(colorLiteralRed: 58/255, green: 64/255, blue: 75/255, alpha: 1)
    let contentLight = UIColor(colorLiteralRed: 254/255, green: 72/255, blue: 71/255, alpha: 1)
    
    var selected:Int!
    var parser:Parser!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barTintColor = Utils.dark
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        title = "Cardápio UECE"
        weekdays = [monday, tuesday,
                         wednesday, thursday, friday]
        
        let currentWeekday = (Calendar.current.component(.weekday, from: Date()))
        selected = (currentWeekday >= 2 && currentWeekday <= 6) ? currentWeekday : 2
        
        for (index, day) in weekdays.enumerated()
        {
            day.tag = index+2
            day.titleLabel?.textColor = (day.tag == selected) ? light : contentLight
            
            day.layer.cornerRadius = day.frame.size.height/2
            day.addTarget(self, action: #selector(ViewController.selectWeekday(sender:)), for: .touchUpInside)
        }
        updateDayFocus()
        
        parser = Parser()
        noInternetView.isHidden = parser.initLocalParser()

        menuBody.text = parser.getContentForWeek(day: selected)
        menuHeader.text = parser.getHeaderForWeek(day: selected)
        
        extrasHeader.text = (parser.extras.isEmpty) ? "" : "Aviso"
        extrasBody.text = parser.extras
    }
    
    override func viewDidAppear(_ animated: Bool) {
        updateDayFocus()
    }
    
    func updateDayFocus()
    {
        for day in weekdays
        {
            if day.tag == selected!
            {
                day.backgroundColor = contentLight
                day.titleLabel?.textColor = light
                day.setTitleColor(light, for: .normal)
            }
            else
            {
                day.titleLabel?.textColor = contentLight
                day.backgroundColor = .clear
                day.layer.borderWidth = 2
                day.layer.borderColor = contentLight.cgColor
            }
        }
    }
    
    func selectWeekday(sender: UIButton!) {
        selected = sender.tag
        updateDayFocus()

        menuBody.text = parser.getContentForWeek(day: selected)
        menuHeader.text = parser.getHeaderForWeek(day: selected)
    }
    
    @IBAction func tryToConnect(_ sender: Any) {
        if parser.initLocalParser()
        {
            menuBody.text = parser.getContentForWeek(day: selected)
            menuHeader.text = parser.getHeaderForWeek(day: selected)
            
            extrasHeader.text = (parser.extras.isEmpty) ? "" : "Aviso"
            extrasBody.text = parser.extras
            
            noInternetView.isHidden = true
        }
    }
    
    func setupView()
    {
        view.backgroundColor = light
        menuBody.isEditable = false
        
        extrasBody.backgroundColor = .clear
        extrasBody.textColor = .white
        extrasBody.isEditable = false
        
        tabBarController?.tabBar.barTintColor = dark
        tabBarController?.tabBar.backgroundColor = dark
        tabBarController?.tabBar.tintColor = contentLight
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

