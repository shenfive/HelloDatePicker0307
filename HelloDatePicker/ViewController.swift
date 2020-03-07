//
//  ViewController.swift
//  HelloDatePicker
//
//  Created by 申潤五 on 2020/3/7.
//  Copyright © 2020 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var theDatePicker: UIDatePicker!
    
    @IBOutlet weak var dateButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        theDatePicker.isHidden = true
        
        let userDefult = UserDefaults.standard
        let lastDate = userDefult.value(forKey: "lastInputDate")
        if let date = lastDate as? Date{
            let formater = DateFormatter()
            formater.dateFormat = "yyyy/MM/dd HH:mm"
            formater.locale = Locale(identifier: "zh_Hant_TW")
            let dateString = formater.string(from: date)
            dateLabel.text = dateString
        }else{
            dateLabel.text = "沒有輸入過"
        }
    }
    @IBAction func dateSeleted(_ sender: UIDatePicker) {
        theDatePicker.isHidden = true
        dateButton.isHidden = false
        let date = sender.date
        let formater = DateFormatter()
        formater.dateFormat = "yyyy/MM/dd HH:mm"
        formater.locale = Locale(identifier: "zh_Hant_TW")
        let dateString = formater.string(from: date)
        dateLabel.text = dateString
        let userDefult = UserDefaults.standard
        userDefult.set(date, forKey: "lastInputDate")
        userDefult.synchronize()
    }
    
    @IBAction func showDatePicker(_ sender: Any) {
        dateButton.isHidden = true
        theDatePicker.isHidden = false
    }
}

