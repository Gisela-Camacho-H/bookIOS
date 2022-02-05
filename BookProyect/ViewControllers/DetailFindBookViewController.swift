//
//  DetailFindBookViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 05/02/22.
//

import UIKit

class DetailFindBookViewController: UIViewController {

    var backButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        
        initUI()
    }
    
    func initUI(){
            
        backButton = UIButton(frame: CGRect(x: 20, y: 70, width: 45, height: 45))
        backButton?.setImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
    }
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }

}

