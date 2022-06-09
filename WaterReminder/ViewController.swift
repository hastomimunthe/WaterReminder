//
//  ViewController.swift
//  WaterReminder
//
//  Created by Hastomi Riduan Munthe on 05/04/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func requestPermission(_ sender: Any) {
        //TODO: Step 1 - Authorization
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                print("All set!")
            } else if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

    


