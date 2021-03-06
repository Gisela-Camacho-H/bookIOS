//
//  UserViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/03/22.
//

import UIKit

class UserViewController: UIViewController {
    
    lazy var userInfoLabel: UILabel = UILabel()
    lazy var userNameLabel: UILabel = UILabel()
    lazy var userEmailLabel: UILabel = UILabel()
    lazy var lightLabel: UILabel = UILabel()
    var defaults = UserDefaults.standard
    lazy var switchMode: UISwitch = UISwitch()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()

     
    }
    
    func initUI(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "paper")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        userInfoLabel = UILabel(frame: CGRect(x: 0, y: 200, width: width, height: 50))
        userInfoLabel.text = "User Information "
        userInfoLabel.applyTitleFont()
        userInfoLabel.textAlignment = .center
        userInfoLabel.textColor = UIColor.brownColor
        view.addSubview(userInfoLabel)
        
        let userName = defaults.string(forKey: "user")
        userNameLabel = UILabel(frame: CGRect(x: 30, y: 300, width: width - 60, height: 50))
        userNameLabel.text = "User Name: \(userName ?? "" )"
        userNameLabel.textAlignment = .center
        userNameLabel.apply25Font()
        view.addSubview(userNameLabel)
        
        let userEmail = defaults.string(forKey: "UserLog")
        userEmailLabel = UILabel(frame: CGRect(x: 30, y: 400, width: width - 60, height: 50))
        userEmailLabel.text = "User Email: \(userEmail ?? "" )"
        userEmailLabel.textAlignment = .center
        userEmailLabel.apply25Font()
        view.addSubview(userEmailLabel)
        
        switchMode = UISwitch(frame:CGRect(x: width/2 - 10, y: 500, width: 10, height: 10))
        switchMode.isOn = true
        switchMode.setOn(true, animated: false)
        switchMode.addTarget(self, action: #selector(switchValueDidChange), for: .valueChanged)
        self.view!.addSubview(switchMode)
        
        lightLabel = UILabel(frame:CGRect(x: width/3 - 40, y: 505, width: 100, height: 20))
        lightLabel.text = "Light Mode "
        lightLabel.apply17Font()
        lightLabel.textAlignment = .center
        lightLabel.textColor = UIColor.brownColor
        view.addSubview(lightLabel)

    }
    
    
    @objc func switchValueDidChange(_ sender: UISwitch!) {
        if (sender.isOn){
            overrideUserInterfaceStyle = .light
            userInfoLabel.textColor = UIColor.brownColor
            userNameLabel.textColor = UIColor.brownColor
            userEmailLabel.textColor = UIColor.brownColor
            lightLabel.textColor = UIColor.brownColor
            
        }
        else{
            overrideUserInterfaceStyle = .dark
            userInfoLabel.textColor = .white
            userNameLabel.textColor = .white
            userEmailLabel.textColor = .white
            lightLabel.textColor = .white
        }
        
    }

}
