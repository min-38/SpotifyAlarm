//
//  ViewController.swift
//  SpotifyAlarm
//
//  Created by Kim Minseo on 1/16/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var setAlarmBtn: UIButton!
    @IBOutlet weak var timePicker: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        timePicker.timeZone = TimeZone.init(identifier: "UTC")
        timePicker.datePickerMode = .time

        setAlarmBtn.addTarget(self, action: #selector(setAlarm), for: .touchUpInside)
    }
    
    @IBAction func setAlarm(_ sender: UIButton) {
        let time = getTime()
        print(time["hour"]!)
        print(time["minute"]!)
    }
    
    func getTime() -> Dictionary<String, Int> {
        let targetTime = timePicker.date

        let components = Calendar.current.dateComponents([.hour, .minute], from: targetTime)
        let hour = components.hour!
        let minute = components.minute!
        
        let dic : [String : Int] = ["hour" : hour, "minute" : minute]
        
        return dic
    }
}
