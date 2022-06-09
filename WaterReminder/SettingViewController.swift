//
//  SettingViewController.swift
//  WaterReminder
//
//  Created by Hastomi Riduan Munthe on 07/04/22.
//
import UIKit
import UserNotifications

class SettingViewController: UIViewController {

    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var kalkulasiDailyWater: UILabel!
    @IBOutlet weak var stateSwitch: UISwitch!
    
    func notify(hour: Int, minute: Int){
        let content = UNMutableNotificationContent()
        content.title = "Drink your water 💧"
        content.body = "Drink Now"
        
        var dateComponents = DateComponents()
        dateComponents.calendar = Calendar.current
        dateComponents.hour = hour
        dateComponents.minute = minute
        
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        //TODO: Step 2c - Add content & trigger to the request
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest (identifier: uuidString,
                                            content: content, trigger: trigger)
        //TODO: Step 2d - Add request to notification center
        let notificationCenter = UNUserNotificationCenter.current()
        notificationCenter.add(request) { (error) in
            if error != nil {
            }
        }
    }
    @IBAction func switchTime(_ sender: UISwitch) {
        if stateSwitch.isOn == true {
            notify(hour: 08, minute: 00)
            notify(hour: 09, minute: 00)
            notify(hour: 10, minute: 00)
            notify(hour: 11, minute: 00)
            notify(hour: 12, minute: 00)
            notify(hour: 13, minute: 00)
            notify(hour: 14, minute: 00)
            notify(hour: 15, minute: 00)
            notify(hour: 16, minute: 00)
            notify(hour: 17, minute: 00)
            notify(hour: 18, minute: 00)
            notify(hour: 19, minute: 00)
            notify(hour: 20, minute: 00)
            notify(hour: 21, minute: 27)
            notify(hour: 22, minute: 00)
            print("berhasil")
        }
        else {
            print("gagal")
            //delete notification
        }
}
        
    let weight = ["45-49 kg","50-54 kg","55-59 kg","60-64 kg","65-69 kg","70-74 kg","75-79 kg","80-84 kg","85-89 kg","90-94 kg","95-99 kg","100 kg"]
    
    var weightPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weightTextField.inputView = weightPickerView
        
        weightTextField.placeholder = "Select Range of Weight"
        
        weightTextField.textAlignment = .center
        
        weightPickerView.delegate = self
        weightPickerView.dataSource = self
        
        weightPickerView.tag = 1
        stateSwitch.isOn = false
    }
}
extension SettingViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return weight.count
        default:
            return 1
        }
    }
      
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return weight[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            weightTextField.text = weight[row]
            switch weight[row] {
            case "45-49 kg" :
                print("1900")
                kalkulasiDailyWater.text = "1900 ml"
            case "50-54 kg" :
                print("2100")
                kalkulasiDailyWater.text = "2100 ml"
            case "55-59 kg" :
                print("2300")
                kalkulasiDailyWater.text = "2300 ml"
            case "60-64 kg" :
                print("2500")
                kalkulasiDailyWater.text = "2500 ml"
            case "65-69 kg" :
                print("2700")
                kalkulasiDailyWater.text = "2700 ml"
            case "70-74 kg" :
                print("2900")
                kalkulasiDailyWater.text = "2900 ml"
            case "75-79 kg" :
                print("3200")
                kalkulasiDailyWater.text = "3200 ml"
            case "80-84 kg" :
                print("3500")
                kalkulasiDailyWater.text = "3500 ml"
            case "85-89 kg" :
                print("3700")
                kalkulasiDailyWater.text = "3700 ml"
            case "90-94 kg" :
                print("3900")
                kalkulasiDailyWater.text = "3900 ml"
            case "95-99 kg" :
                print("4100")
                kalkulasiDailyWater.text = "4100 ml"
            case "100 kg" :
                print("4300")
                kalkulasiDailyWater.text = "4300 ml"
            default:
                print("")
            }
            weightTextField.resignFirstResponder()
        default:
            return
        }
    }
}


