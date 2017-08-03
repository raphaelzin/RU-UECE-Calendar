//
//  InfoViewController.swift
//  RUCalendar
//
//  Created by Raphael Souza on 17-07-28.
//  Copyright © 2017 com.raphael. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setupView()
    {
        view.backgroundColor = Utils.light
    }
}
