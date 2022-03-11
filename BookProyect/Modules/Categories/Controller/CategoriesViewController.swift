//
//  CategoriesViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class CategoriesViewController:  UIViewController, CategoryManagerDelegate, UITextFieldDelegate{
    
    // Labels
    lazy var buscarLabel : UILabel = UILabel()
    lazy var date : UILabel = UILabel()
    lazy var titleLabel : UILabel = UILabel()
    lazy var title1 : UILabel = UILabel()
    lazy var contentLabel : UILabel = UILabel()
    lazy var content1: UILabel = UILabel()
    lazy var content2: UILabel = UILabel()
    lazy var content3: UILabel = UILabel()
    lazy var content4: UILabel = UILabel()
    lazy var content5: UILabel = UILabel()
    
    lazy var backButton: UIButton = UIButton()
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var SearchTextField: UITextField!
    var categoryManager = CategoryManager()

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
            
            backButton = UIButton(frame: CGRect(x: 25, y: height/7 - 60, width: 45, height: 45))
            backButton.setImage(UIImage(named: "back"), for: .normal)
            backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton)
                
            buscarLabel = UILabel(frame: CGRect(x: 10, y: 170, width: width , height: 40))
            buscarLabel.textAlignment = NSTextAlignment.center
            buscarLabel.backgroundColor = .clear
            buscarLabel.textColor = UIColor.brownColor
            buscarLabel.font = UIFont(name: "Arial Bold", size: 22)
            buscarLabel.text = "Enter the Genres!"
            view.addSubview(buscarLabel)
        
            SearchTextField = UITextField(frame: CGRect(x: 70, y: 220, width: width - 120 , height: 50))
            SearchTextField?.placeholder = "Genres"
            SearchTextField?.textAlignment = .center
            SearchTextField?.backgroundColor = .white
            SearchTextField?.layer.cornerRadius = 7
            SearchTextField?.layer.borderColor = UIColor.black.cgColor
            SearchTextField?.layer.borderWidth = 2
            view.addSubview(SearchTextField!)
            
            titleLabel = UILabel(frame: CGRect(x: 60, y: 290, width: width - 120 , height: 50))
            titleLabel.textAlignment = NSTextAlignment.center
            titleLabel.backgroundColor = UIColor.brownColor
            titleLabel.textColor = UIColor.pinkColor
            titleLabel.numberOfLines = 0
            titleLabel.layer.cornerRadius = 7
            titleLabel.font = UIFont(name: "Arial Bold", size: 25)
            titleLabel.text = " Genres:"
            view.addSubview(titleLabel)
                
            title1 = UILabel(frame: CGRect(x: 40, y: 340, width: width - 80 , height: 60))
            title1.textAlignment = NSTextAlignment.center
            title1.backgroundColor = .clear
            title1.textColor = UIColor.brownColor
            title1.numberOfLines = 0
            title1.font = UIFont(name: "Arial Bold", size: 20)
            title1.text = ""
            view.addSubview(title1)
                
            contentLabel = UILabel(frame: CGRect(x: 60, y: 400, width: width - 120 , height: 50))
            contentLabel.textAlignment = NSTextAlignment.center
            contentLabel.backgroundColor = UIColor.brownColor
            contentLabel.textColor = UIColor.pinkColor
            contentLabel.numberOfLines = 0
            contentLabel.layer.cornerRadius = 7
            contentLabel.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel.text = "Top 5:"
            view.addSubview(contentLabel)
                
            content1 = UILabel(frame: CGRect(x: 40, y: 460, width: width - 80 , height: 60))
            content1.textAlignment = NSTextAlignment.center
            content1.backgroundColor = .clear
            content1.textColor = UIColor.brownColor
            content1.numberOfLines = 0
            content1.font = UIFont(name: "Arial Bold", size: 20)
            content1.text = ""
            view.addSubview(content1)
                
            content2 = UILabel(frame: CGRect(x: 40, y: 520, width: width - 80 , height: 60))
            content2.textAlignment = NSTextAlignment.center
            content2.backgroundColor = .clear
            content2.textColor = UIColor.brownColor
            content2.numberOfLines = 0
            content2.font = UIFont(name: "Arial Bold", size: 20)
            content2.text = ""
            view.addSubview(content2)
                
            content3 = UILabel(frame: CGRect(x: 40, y: 580, width: width - 80 , height: 60))
            content3.textAlignment = NSTextAlignment.center
            content3.backgroundColor = .clear
            content3.textColor = UIColor.brownColor
            content3.numberOfLines = 0
            content3.font = UIFont(name: "Arial Bold", size: 20)
            content3.text = ""
            view.addSubview(content3)
            
            content4 = UILabel(frame: CGRect(x: 40, y: 640, width: width - 80 , height: 60))
            content4.textAlignment = NSTextAlignment.center
            content4.backgroundColor = .clear
            content4.textColor = UIColor.brownColor
            content4.numberOfLines = 0
            content4.font = UIFont(name: "Arial Bold", size: 20)
            content4.text = ""
            view.addSubview(content4)
                
            content5 = UILabel(frame: CGRect(x: 40, y: 700, width: width - 80 , height: 60))
            content5.textAlignment = NSTextAlignment.center
            content5.backgroundColor = .clear
            content5.textColor = UIColor.brownColor
            content5.numberOfLines = 0
            content5.font = UIFont(name: "Arial Bold", size: 20)
            content5.text = ""
            view.addSubview(content5)
        
    }
    
    func createActivityIndicator() {
        self.view.addSubview(activityView)
        activityView.color = UIColor.brownColor
        activityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor), activityView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        activityView.startAnimating()
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
                categoryManager.fetchCategory(bookName: Name, view: activityView)
                createActivityIndicator()
            }
            SearchTextField.text = ""
        }
            func didUpdateCategory(_ categoryManager: CategoryManager, categoryid: CategoryModel) {
                DispatchQueue.main.async {
                    self.activityView.removeFromSuperview()
                    self.activityView.stopAnimating()
                    self.title1.text = categoryid.name
                    self.content1.text = categoryid.title1
                    self.content2.text = categoryid.title2
                    self.content3.text = categoryid.title3
                    self.content4.text = categoryid.title4
                    self.content5.text = categoryid.title5
                    }

                }
        }
