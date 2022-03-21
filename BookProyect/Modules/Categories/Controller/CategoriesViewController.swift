//
//  CategoriesViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class CategoriesViewController:  UIViewController, CategoryManagerDelegate, UITextFieldDelegate{
    
    // Labels
    lazy var findLabel : UIView.findLabel = UIView.findLabel()
    
    lazy var title1 :  UIView.clearLabels = UIView.clearLabels()
    lazy var content1: UIView.clearLabels = UIView.clearLabels()
    lazy var content2: UIView.clearLabels = UIView.clearLabels()
    lazy var content3: UIView.clearLabels = UIView.clearLabels()
    lazy var content4: UIView.clearLabels = UIView.clearLabels()
    lazy var content5: UIView.clearLabels = UIView.clearLabels()
    
    lazy var contentLabel :  UIView.brownLabels = UIView.brownLabels()
    lazy var titleLabel : UIView.brownLabels = UIView.brownLabels()
    
    lazy var backButton: UIButton = UIButton()
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var SearchTextField: UIView.findTextField = UIView.findTextField()
    var categoryManager = CategoryManager()
    lazy var labelStackView1: UIStackView = UIStackView()

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
                
            findLabel = UIView.findLabel(frame: CGRect(x: 10, y: 170, width: width , height: 40))
            findLabel.text = "Enter the Genres!"
            view.addSubview(findLabel)
        
            SearchTextField = UIView.findTextField(frame: CGRect(x: 70, y: 220, width: width - 120 , height: 50))
            SearchTextField.placeholder = "Genres"
            view.addSubview(SearchTextField)
            
            titleLabel = UIView.brownLabels(frame: CGRect(x: 0, y: 290, width: width , height: 50))
            titleLabel.text = " Genres:"
            view.addSubview(titleLabel)
                
            title1 = UIView.clearLabels(frame: CGRect(x: 40, y: 330, width: width - 80 , height: 60))
            title1.textAlignment = NSTextAlignment.center
            title1.text = ""
            view.addSubview(title1)
                
            contentLabel = UIView.brownLabels(frame: CGRect(x: 0, y: 380, width: width , height: 50))
            contentLabel.text = "Top 5:"
            view.addSubview(contentLabel)
                
                
            self.view.addSubview(content1)
            self.view.addSubview(content2)
            self.view.addSubview(content3)
            self.view.addSubview(content4)
            self.view.addSubview(content5)
            content1.text = ""
            content2.text = ""
            content3.text = ""
            content4.text = ""
            content5.text = ""

            let labelArray1: [UILabel] = [content1, content2, content3, content4, content5]
            
            labelStackView1.axis = .vertical
            labelStackView1.spacing = 10
            labelStackView1.alignment = .fill
            labelStackView1.distribution = .fillEqually
                labelArray1.forEach {label1 in
                labelStackView1.addArrangedSubview(label1)
                }
            view.addSubview(labelStackView1)
            labelStackView1.translatesAutoresizingMaskIntoConstraints = false
                    
            NSLayoutConstraint.activate([labelStackView1.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10)])
            labelArray1.forEach {label1 in
            label1.heightAnchor.constraint(equalToConstant: Constants.height/20).isActive = true
            label1.widthAnchor.constraint(equalToConstant: Constants.width).isActive = true
            label1.textAlignment = .center
            }
        
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
                categoryManager.fetchCategory(categoryName: Name, view: activityView)
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
