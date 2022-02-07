//
//  CategoriesViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class CategoriesViewController:  UIViewController, CategoryManagerDelegate, UITextFieldDelegate{
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var buscarLabel : UILabel?
    var SearchTextField: UITextField!
    var date : UILabel?
    var titleLabel : UILabel?
    var title1 : UILabel?
    var contentLabel : UILabel?
    var content1: UILabel?
    var content2: UILabel?
    var content3: UILabel?
    var content4: UILabel?
    var content5: UILabel?
    var backButton: UIButton?
    
    var categoryManager = CategoryManager()
    
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
            
        categoryManager.delegate = self
        SearchTextField.delegate = self
    }
            func initUI(){
                
            backButton = UIButton(frame: CGRect(x: 20, y: 60, width: 45, height: 45))
            backButton?.setImage(UIImage(named: "back"), for: .normal)
            backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton!)
                
                
            buscarLabel = UILabel(frame: CGRect(x: 10, y: 170, width: width , height: 40))
            buscarLabel?.textAlignment = NSTextAlignment.center
            buscarLabel?.backgroundColor = .clear
            buscarLabel?.textColor = brownColor
            buscarLabel?.font = UIFont(name: "Arial Bold", size: 22)
            buscarLabel?.text = "Enter the Genres!"
            view.addSubview(buscarLabel!)
        
            SearchTextField = UITextField(frame: CGRect(x: 70, y: 220, width: width - 120 , height: 50))
            SearchTextField?.placeholder = "Genres"
            SearchTextField?.textAlignment = .center
            SearchTextField?.backgroundColor = .white
            SearchTextField?.layer.cornerRadius = 7
            SearchTextField?.layer.borderColor = UIColor.black.cgColor
            SearchTextField?.layer.borderWidth = 2
            view.addSubview(SearchTextField!)
            
            titleLabel = UILabel(frame: CGRect(x: 60, y: 290, width: width - 120 , height: 50))
            titleLabel?.textAlignment = NSTextAlignment.center
            titleLabel?.backgroundColor = brownColor
            titleLabel?.textColor = pinkColor
            titleLabel?.numberOfLines = 0
            titleLabel?.layer.cornerRadius = 7
            titleLabel?.font = UIFont(name: "Arial Bold", size: 25)
            titleLabel?.text = " Genres:"
            view.addSubview(titleLabel!)
                
            title1 = UILabel(frame: CGRect(x: 40, y: 340, width: width - 80 , height: 60))
            title1?.textAlignment = NSTextAlignment.center
            title1?.backgroundColor = .clear
            title1?.textColor = brownColor
            title1?.numberOfLines = 0
            title1?.font = UIFont(name: "Arial Bold", size: 20)
            title1?.text = ""
            view.addSubview(title1!)
                
            contentLabel = UILabel(frame: CGRect(x: 60, y: 400, width: width - 120 , height: 50))
            contentLabel?.textAlignment = NSTextAlignment.center
            contentLabel?.backgroundColor = brownColor
            contentLabel?.textColor = pinkColor
            contentLabel?.numberOfLines = 0
            contentLabel?.layer.cornerRadius = 7
            contentLabel?.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel?.text = "Top 5:"
            view.addSubview(contentLabel!)
                
            content1 = UILabel(frame: CGRect(x: 40, y: 460, width: width - 80 , height: 60))
            content1?.textAlignment = NSTextAlignment.center
            content1?.backgroundColor = .clear
            content1?.textColor = brownColor
            content1?.numberOfLines = 0
            content1?.font = UIFont(name: "Arial Bold", size: 20)
            content1?.text = ""
            view.addSubview(content1!)
                
            content2 = UILabel(frame: CGRect(x: 40, y: 520, width: width - 80 , height: 60))
            content2?.textAlignment = NSTextAlignment.center
            content2?.backgroundColor = .clear
            content2?.textColor = brownColor
            content2?.numberOfLines = 0
            content2?.font = UIFont(name: "Arial Bold", size: 20)
            content2?.text = ""
            view.addSubview(content2!)
                
            content3 = UILabel(frame: CGRect(x: 40, y: 580, width: width - 80 , height: 60))
            content3?.textAlignment = NSTextAlignment.center
            content3?.backgroundColor = .clear
            content3?.textColor = brownColor
            content3?.numberOfLines = 0
            content3?.font = UIFont(name: "Arial Bold", size: 20)
            content3?.text = ""
            view.addSubview(content3!)
                
            content4 = UILabel(frame: CGRect(x: 40, y: 640, width: width - 80 , height: 60))
            content4?.textAlignment = NSTextAlignment.center
            content4?.backgroundColor = .clear
            content4?.textColor = brownColor
            content4?.numberOfLines = 0
            content4?.font = UIFont(name: "Arial Bold", size: 20)
            content4?.text = ""
            view.addSubview(content4!)
                
            content5 = UILabel(frame: CGRect(x: 40, y: 700, width: width - 80 , height: 60))
            content5?.textAlignment = NSTextAlignment.center
            content5?.backgroundColor = .clear
            content5?.textColor = brownColor
            content5?.numberOfLines = 0
            content5?.font = UIFont(name: "Arial Bold", size: 20)
            content5?.text = ""
            view.addSubview(content5!)
        
    }
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
        
        func SearchPressed(_ sender: UIButton) {
            SearchTextField.endEditing(true)
            print(SearchTextField.text!)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            SearchTextField.endEditing(true)
            print(SearchTextField.text!)
            return true
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if let Name = SearchTextField.text {
                categoryManager.fetchCategory(bookName: Name)
            }
            SearchTextField.text = ""
        }
            func didUpdateCategory(_ categoryManager: CategoryManager, categoryid: CategoryModel) {
                DispatchQueue.main.async {
                    self.title1?.text = categoryid.name
                    self.content1?.text = categoryid.title1
                    self.content2?.text = categoryid.title2
                    self.content3?.text = categoryid.title3
                    self.content4?.text = categoryid.title4
                    self.content5?.text = categoryid.title5
                    }

                }
        }


