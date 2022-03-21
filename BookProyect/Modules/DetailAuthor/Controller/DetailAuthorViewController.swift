//
//  DetailAuthorViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 07/02/22.
//

import UIKit

class DetailAuthorViewController: UIViewController, BioManagerDelegate, UITextFieldDelegate{
    
    // Labels
    var date : UILabel = UILabel()
    
    var title1 : UIView.clearLabels = UIView.clearLabels()
    var content1: UIView.clearLabels = UIView.clearLabels()
    
    var titleLabel : UIView.brownLabels = UIView.brownLabels()
    var contentLabel :  UIView.brownLabels = UIView.brownLabels()
    
    var backButton: UIButton = UIButton()
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var SearchTextField: UITextField!
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
            backButton.setImage(UIImage(named: "back"), for: .normal)
            backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton)
                
                
            titleLabel = UIView.brownLabels(frame: CGRect(x: 0, y: 180, width: width , height: 60))
            titleLabel.text = " Author Name:"
            view.addSubview(titleLabel)
                        
            title1 = UIView.clearLabels(frame: CGRect(x: 40, y: 240, width: width - 80 , height: 60))
            title1.textAlignment = NSTextAlignment.center
            title1.text = nameAuthor
            view.addSubview(title1)
                        
            contentLabel = UIView.brownLabels(frame: CGRect(x: 0, y: 300, width: width, height: 60))
            contentLabel.text = "Author Biography:"
            view.addSubview(contentLabel)
                        
            content1 = UIView.clearLabels(frame: CGRect(x: 40, y: 380, width: width - 80 , height: 300))
            content1.textAlignment = NSTextAlignment.justified
            content1.adjustsFontSizeToFitWidth = true
            content1.text = ""
            view.addSubview(content1)
        
    }
    
    func creaeActivityIndicator() {
        self.view.addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor), activityView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        activityView.startAnimating()
    }
    
    func removeActivityIndicator() {
        activityView.stopAnimating()
        activityView.removeFromSuperview()
    }
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
        
    func fetchData(){
        if let name = endPointKey {
            bioManager.fetchBio(authorDetailName: name)
            creaeActivityIndicator()
        }
    }
    
            func didUpdateBio(_ bioManager: BioManager, bioid: BioModel) {
                DispatchQueue.main.async {
                    self.activityView.removeFromSuperview()
                    self.activityView.stopAnimating()
                    self.content1.text = bioid.bio
                    }

                }
        }

