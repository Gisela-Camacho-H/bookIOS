//
//  DetailAuthorViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 07/02/22.
//

import UIKit

class DetailAuthorViewController: UIViewController, BioManagerDelegate, UITextFieldDelegate{
    
    var buscarLabel : UILabel?
    var SearchTextField: UITextField!
    var date : UILabel?
    var titleLabel : UILabel?
    var title1 : UILabel?
    var contentLabel : UILabel?
    var content1: UILabel?
    var backButton: UIButton?
    
    var endPointKey : String?
    var nameAuthor :String?
    var bioManager = BioManager()

    override func viewDidLoad() {
        super.viewDidLoad()
           
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        initUI()
        
        bioManager.delegate = self
        
        fetchData()
        
        
    }
            func initUI(){
                
            backButton = UIButton(frame: CGRect(x: 20, y: 60, width: 45, height: 45))
            backButton?.setImage(UIImage(named: "back"), for: .normal)
            backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton!)
                
        
            titleLabel = UILabel(frame: CGRect(x: 60, y: 180, width: width - 120 , height: 50))
            titleLabel?.textAlignment = NSTextAlignment.center
                titleLabel?.backgroundColor = UIColor.brownColor
                titleLabel?.textColor = UIColor.pinkColor
            titleLabel?.numberOfLines = 0
            titleLabel?.layer.cornerRadius = 7
            titleLabel?.font = UIFont(name: "Arial Bold", size: 25)
            titleLabel?.text = " Author Name:"
            view.addSubview(titleLabel!)
                
            title1 = UILabel(frame: CGRect(x: 40, y: 230, width: width - 80 , height: 60))
            title1?.textAlignment = NSTextAlignment.center
            title1?.backgroundColor = .clear
                title1?.textColor = UIColor.brownColor
            title1?.numberOfLines = 0
            title1?.font = UIFont(name: "Arial Bold", size: 22)
            title1?.text = nameAuthor
            view.addSubview(title1!)
                
            contentLabel = UILabel(frame: CGRect(x: 60, y: 290, width: width - 120 , height: 50))
            contentLabel?.textAlignment = NSTextAlignment.center
                contentLabel?.backgroundColor = UIColor.brownColor
                contentLabel?.textColor = UIColor.pinkColor
            contentLabel?.numberOfLines = 0
            contentLabel?.layer.cornerRadius = 7
            contentLabel?.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel?.text = "Author Biography:"
            view.addSubview(contentLabel!)
                
            content1 = UILabel(frame: CGRect(x: 40, y: 360, width: width - 80 , height: 340))
            content1?.textAlignment = NSTextAlignment.justified
            content1?.backgroundColor = .clear
                content1?.textColor = UIColor.brownColor
            content1?.numberOfLines = 0
            content1?.adjustsFontSizeToFitWidth = true
            content1?.font = UIFont(name: "Arial Bold", size: 20)
            content1?.text = ""
            view.addSubview(content1!)
        
    }
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
        
    func fetchData(){
        if let name = endPointKey {
            bioManager.fetchBio(bookName: name)
        }
    }
    
            func didUpdateBio(_ bioManager: BioManager, bioid: BioModel) {
                DispatchQueue.main.async {
                    self.content1?.text = bioid.bio
                    }

                }
        }

