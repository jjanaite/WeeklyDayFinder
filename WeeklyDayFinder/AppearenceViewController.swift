//
//  AppearenceViewController.swift
//  WeeklyDayFinder
//
//  Created by justine.janaite on 30/08/2020.
//  Copyright © 2020 justine.janaite. All rights reserved.
//

import UIKit

class AppearenceViewController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabelText()

        
    }
    
    @IBAction func openSettingsTapped(_ sender: Any) {
        
        guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
        return
    }
    
        if UIApplication.shared.canOpenURL(settingsURL){
            UIApplication.shared.open(settingsURL, options: [:]) { (success) in
                print(success)
            }
        }
    }
    
    func setLabelText(){
        var text = "Unable to specify UI style"
        
        if self.traitCollection.userInterfaceStyle == .dark {
            text = "Dark Mode is on. \nGo to settings if you would like\nto change to Light Mode."
        }else{
            text = "Light Mode is on. \nGo to settings if you would like\nto change to Dark Mode."
        }
        textLabel.text = text
    }
    
}//end class

extension AppearenceViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setLabelText()
    }
}
