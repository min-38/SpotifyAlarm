//
//  ViewController.swift
//  SpotifyAlarm
//
//  Created by Kim Minseo on 1/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var setAlarmBtn: UIButton!
    @IBOutlet weak var DaysStack: UIStackView!
    @IBOutlet weak var timePicker: UIDatePicker!
    
    var time : [String : Int] = ["hour": 0, "minute": 0];
    var days : [String : Int] = ["Monday" : 0, "Tuesday" : 0, "Wednesday": 0, "Thursday": 0, "Friday": 0, "Saturday": 0, "Sunday": 0];

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timePicker.timeZone = TimeZone.init(identifier: "UTC")
        timePicker.datePickerMode = .time

        setAlarmBtn.addTarget(self, action: #selector(setAlarm), for: .touchUpInside)
    }
    
    @IBAction func setDays(_ sender: Any) {
        guard let day = (sender as? UIButton)?.tag else {
            return
        }
        
        var s : String = "Monday"
        
        switch day {
        case 0:
            s = "Monday"
        case 1:
            s = "Tuesday"
        case 2:
            s = "Wednesday"
        case 3:
            s = "Thursday"
        case 4:
            s = "Friday"
        case 5:
            s = "Saturday"
        case 6:
            s = "Sunday"
        default:
            s = "Monday"
        }
        
        if days[s] == 0 {
            days[s] = 1
            (sender as! UIButton).backgroundColor = .red
        } else {
            days[s] = 0
            (sender as! UIButton).backgroundColor = .blue
        }
    }
    
    @IBAction func setAlarm(_ sender: UIButton) {
        getTime()
        getDays()
//        print(time["hour"]!)
//        print(time["minute"]!)
    }
    
    @IBAction func getTime() {
        let targetTime = timePicker.date

        let components = Calendar.current.dateComponents([.hour, .minute], from: targetTime)
        let hour = components.hour!
        let minute = components.minute!
        
        time = ["hour" : hour, "minute" : minute]
    }
    
    @IBAction func getDays() {
        let targetTime = timePicker.date

        let components = Calendar.current.dateComponents([.hour, .minute], from: targetTime)
        let hour = components.hour!
        let minute = components.minute!
        
        time = ["hour" : hour, "minute" : minute]
    }
}
