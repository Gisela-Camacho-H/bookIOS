//
//  DetailFindBookViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 05/02/22.
//

import UIKit

class DetailFindBookViewController: UIViewController, DetailManagerDelegate, UITextFieldDelegate{
    
    // labels
    lazy var buscarLabel : UILabel = UILabel()
    lazy var date : UILabel = UILabel()
    lazy var titleLabel : UILabel = UILabel()
    lazy var title1 : UILabel = UILabel()
    lazy var contentLabel : UILabel = UILabel()
    lazy var content1: UILabel = UILabel()
    
    lazy var backButton: UIButton = UIButton()
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    var SearchTextField: UITextField!
    var endPointKey : String?
    var detailManager = DetailManager()

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
            backButton.setImage(UIImage(named: "back"), for: .normal)
            backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton)
                
        
            titleLabel = UILabel(frame: CGRect(x: 60, y: 180, width: width - 120 , height: 60))
            titleLabel.textAlignment = NSTextAlignment.center
            titleLabel.backgroundColor = UIColor.brownColor
            titleLabel.textColor = UIColor.pinkColor
            titleLabel.numberOfLines = 0
            titleLabel.layer.cornerRadius = 7
            titleLabel.font = UIFont(name: "Arial Bold", size: 25)
            titleLabel.text = " Book Name:"
            view.addSubview(titleLabel)
                
            title1 = UILabel(frame: CGRect(x: 40, y: 250, width: width - 80 , height: 60))
            title1.textAlignment = NSTextAlignment.center
            title1.backgroundColor = .clear
            title1.textColor = UIColor.brownColor
            title1.numberOfLines = 0
            title1.font = UIFont(name: "Arial Bold", size: 22)
            title1.text = ""
            view.addSubview(title1)
                
            contentLabel = UILabel(frame: CGRect(x: 60, y: 330, width: width - 120 , height: 60))
            contentLabel.textAlignment = NSTextAlignment.center
            contentLabel.backgroundColor = UIColor.brownColor
            contentLabel.textColor = UIColor.pinkColor
            contentLabel.numberOfLines = 0
            contentLabel.layer.cornerRadius = 7
            contentLabel.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel.text = "Book Description:"
            view.addSubview(contentLabel)
                
            content1 = UILabel(frame: CGRect(x: 40, y: 410, width: width - 80 , height: 300))
            content1.textAlignment = NSTextAlignment.justified
            content1.backgroundColor = .clear
            content1.textColor = UIColor.brownColor
            content1.numberOfLines = 0
            content1.adjustsFontSizeToFitWidth = true
            content1.font = UIFont(name: "Arial Bold", size: 20)
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
            detailManager.fetchDetail(bookName: name)
            creaeActivityIndicator()
        }
    }
    
            func didUpdateDetail(_ detailManager: DetailManager, detailid: DetailModel) {
                DispatchQueue.main.async {
                    self.activityView.removeFromSuperview()
                    self.activityView.stopAnimating()
                    self.title1.text = detailid.title
                    self.content1.text = detailid.description
                    }

                }
        }



