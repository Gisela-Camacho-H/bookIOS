//
//  UserViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/03/22.
//

import UIKit

class UserViewController: UIViewController {
    
    lazy var userInfoLabel: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        userInfoLabel = UILabel(frame: CGRect(x: 0, y: 100, width: width, height: 50))
        userInfoLabel.text = "User Information "
        userInfoLabel.font = .boldSystemFont(ofSize: 35)
        userInfoLabel.textAlignment = .center
        userInfoLabel.textColor = UIColor.brownColor
        view.addSubview(userInfoLabel)
    }

}

