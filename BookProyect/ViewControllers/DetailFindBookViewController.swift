//
//  DetailFindBookViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 05/02/22.
//

import UIKit

class DetailFindBookViewController: UIViewController, DetailManagerDelegate, UITextFieldDelegate{
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var buscarLabel : UILabel?
    var SearchTextField: UITextField!
    var date : UILabel?
    var titleLabel : UILabel?
    var title1 : UILabel?
    var contentLabel : UILabel?
    var content1: UILabel?
    var backButton: UIButton?
    
    var endPointKey : String?
    
    var detailManager = DetailManager()
    
    var backgroundColor = UIColor(displayP3Red: 255/255, green: 242/255, blue: 223/255, alpha: 1)
    var brownColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
    var pinkColor = UIColor(displayP3Red: 241/255, green: 200/255, blue: 173/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()
           
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        initUI()
        
        detailManager.delegate = self
        
        fetchData()
        
        
    }
            func initUI(){
                
            backButton = UIButton(frame: CGRect(x: 20, y: 60, width: 45, height: 45))
            backButton?.setImage(UIImage(named: "back"), for: .normal)
            backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton!)
                
        
            titleLabel = UILabel(frame: CGRect(x: 60, y: 180, width: width - 120 , height: 60))
            titleLabel?.textAlignment = NSTextAlignment.center
            titleLabel?.backgroundColor = brownColor
            titleLabel?.textColor = pinkColor
            titleLabel?.numberOfLines = 0
            titleLabel?.layer.cornerRadius = 7
            titleLabel?.font = UIFont(name: "Arial Bold", size: 25)
            titleLabel?.text = " Book Name:"
            view.addSubview(titleLabel!)
                
            title1 = UILabel(frame: CGRect(x: 40, y: 250, width: width - 80 , height: 60))
            title1?.textAlignment = NSTextAlignment.center
            title1?.backgroundColor = .clear
            title1?.textColor = brownColor
            title1?.numberOfLines = 0
            title1?.font = UIFont(name: "Arial Bold", size: 22)
            title1?.text = ""
            view.addSubview(title1!)
                
            contentLabel = UILabel(frame: CGRect(x: 60, y: 330, width: width - 120 , height: 60))
            contentLabel?.textAlignment = NSTextAlignment.center
            contentLabel?.backgroundColor = brownColor
            contentLabel?.textColor = pinkColor
            contentLabel?.numberOfLines = 0
            contentLabel?.layer.cornerRadius = 7
            contentLabel?.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel?.text = "Book Description:"
            view.addSubview(contentLabel!)
                
            content1 = UILabel(frame: CGRect(x: 40, y: 410, width: width - 80 , height: 300))
            content1?.textAlignment = NSTextAlignment.justified
            content1?.backgroundColor = .clear
            content1?.textColor = brownColor
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
            detailManager.fetchDetail(bookName: name)
        }
    }
    
            func didUpdateDetail(_ detailManager: DetailManager, detailid: DetailModel) {
                DispatchQueue.main.async {
                    self.title1?.text = detailid.title
                    self.content1?.text = detailid.description
                    }

                }
        }



