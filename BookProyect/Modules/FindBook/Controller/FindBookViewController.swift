//
//  FindBookViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class FindBookViewController: UIViewController, BookManagerDelegate, UITextFieldDelegate{
    
    // Labels
    lazy var findLabel : UILabel = UILabel()
    lazy var date: UILabel = UILabel()
    lazy var titleLabel : UILabel = UILabel()
    lazy var titleText: UILabel = UILabel()
    lazy var contentLabel1 : UILabel = UILabel()
    lazy var contentText: UILabel = UILabel()
    lazy var contentLabel2 : UILabel = UILabel()
    lazy var contentText1: UILabel = UILabel()
    lazy var contentLabel3 : UILabel = UILabel()
    lazy var contentText2: UILabel = UILabel()
    
    var searchTextField: UITextField!
    
    // Buttons
    lazy var goBookButton: UIButton = UIButton()
    lazy var backButton: UIButton = UIButton()
    
    // stacksView
    lazy var labelStackView: UIStackView = UIStackView()
    lazy var labelStackView1: UIStackView = UIStackView()
    
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    var fetchedEndPoint : String?
    var bookManager = BookManager()

    override func viewDidLoad() {
        super.viewDidLoad()
           
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        initUI()
            
        bookManager.delegate = self
        searchTextField.delegate = self
    }
            func initUI(){
                
            backButton = UIButton(frame: CGRect(x: 25, y: height/7 - 60, width: 45, height: 45))
            backButton.setImage(UIImage(named: "back"), for: .normal)
            backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
            view.addSubview(backButton)
                
                
            findLabel = UILabel(frame: CGRect(x: 10, y: 170, width: width , height: 40))
            findLabel.textAlignment = NSTextAlignment.center
            findLabel.backgroundColor = .clear
            findLabel.textColor = UIColor.brownColor
            findLabel.font = UIFont(name: "Arial Bold", size: 22)
            findLabel.text = " Enter the book's name "
            view.addSubview(findLabel)
        
            searchTextField = UITextField(frame: CGRect(x: 70, y: 220, width: width - 120 , height: 50))
            searchTextField?.placeholder = " Book Name "
            searchTextField?.textAlignment = .center
            searchTextField?.backgroundColor = .white
            searchTextField?.layer.cornerRadius = 7
            searchTextField?.layer.borderColor = UIColor.black.cgColor
            searchTextField?.layer.borderWidth = 2
            view.addSubview(searchTextField!)
                
            self.view.addSubview(titleLabel)
            self.view.addSubview(contentLabel1)
            self.view.addSubview(contentLabel2)
            self.view.addSubview(contentLabel3)
            titleLabel.text = "Book Name:"
            contentLabel1.text = "First Publish Year:"
            contentLabel2.text = "Author Name:"
            contentLabel3.text = "Author Id:"

            let labelArray: [UILabel] = [titleLabel, contentLabel1, contentLabel2, contentLabel3]
            
            labelStackView.axis = .vertical
            labelStackView.spacing = Constants.height/16
            labelStackView.alignment = .fill
            labelStackView.distribution = .fillEqually
            labelArray.forEach {label in
            labelStackView.addArrangedSubview(label)
            }
            view.addSubview(labelStackView)
            labelStackView.translatesAutoresizingMaskIntoConstraints = false
                
                NSLayoutConstraint.activate([labelStackView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10)])
                labelArray.forEach {label in
                    label.heightAnchor.constraint(equalToConstant: Constants.height/20).isActive = true
                    label.widthAnchor.constraint(equalToConstant: Constants.width).isActive = true
                    label.numberOfLines = 0
                    label.textColor = UIColor.pinkColor
                    label.textAlignment = .center
                    label.backgroundColor = UIColor.brownColor
                    label.layer.cornerRadius = 10
                    label.font = UIFont(name: "Arial Bold", size: 25)
                }

                
                self.view.addSubview(titleText)
                self.view.addSubview(contentText)
                self.view.addSubview(contentText1)
                self.view.addSubview(contentText2)
                titleText.text = ""
                contentText.text = ""
                contentText1.text = ""
                contentText2.text = ""

                let labelArray1: [UILabel] = [titleText, contentText, contentText1, contentText2]
                
                labelStackView1.axis = .vertical
                labelStackView1.spacing = Constants.height/16
                labelStackView1.alignment = .fill
                labelStackView1.distribution = .fillEqually
                labelArray1.forEach {label1 in
                labelStackView1.addArrangedSubview(label1)
                }
                view.addSubview(labelStackView1)
                labelStackView1.translatesAutoresizingMaskIntoConstraints = false
                    
                    NSLayoutConstraint.activate([labelStackView1.topAnchor.constraint(equalTo: titleLabel.topAnchor, constant: Constants.cornerRadius + 30)])
                    labelArray1.forEach {label1 in
                        label1.heightAnchor.constraint(equalToConstant: Constants.height/20).isActive = true
                        label1.widthAnchor.constraint(equalToConstant: Constants.width).isActive = true
                        label1.numberOfLines = 0
                        label1.textColor = UIColor.brownColor
                        label1.textAlignment = .center
                        label1.backgroundColor = .clear
                        label1.font = UIFont(name: "Arial Bold", size: 17)
                    }
                
            goBookButton = UIButton(frame: CGRect(x: width - 90, y: height - 200, width: 70 , height: 50))
            goBookButton.setTitle("+ info", for: .normal)
            goBookButton.setTitleColor(.brownColor, for: .normal)
            goBookButton.addTarget(self, action: #selector(go), for: .touchUpInside)
            goBookButton.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 20)
            view.addSubview(goBookButton)

    }
    
    func createActivityIndicator() {
        self.view.addSubview(activityView)
        activityView.color = UIColor.brownColor
        activityView.backgroundColor = .white
        activityView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor), activityView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor )
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
        
    @objc func go (){
        print("go to this book")
         let register = DetailFindBookViewController()
        register.endPointKey = fetchedEndPoint
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
    
        func SearchPressed(_ sender: UIButton) {
            searchTextField.endEditing(true)
            print(searchTextField.text!)
        }
        
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            searchTextField.endEditing(true)
            print(searchTextField.text!)
            return true
        }
        func textFieldDidEndEditing(_ textField: UITextField) {
            
            if let Name = searchTextField.text {
                bookManager.fetchBook(bookName: Name)
                createActivityIndicator()
            }
            searchTextField.text = ""
        }
            func didUpdateBook(_ bookManager: BookManager, bookid: BookModel) {
                DispatchQueue.main.async {
                    self.activityView.removeFromSuperview()
                    self.activityView.stopAnimating()
                    self.titleText.text = String(bookid.title)
                    self.contentText.text = String(bookid.first ?? 0)
                    self.contentText1.text = bookid.author_name
                    self.contentText2.text = bookid.author_key
                    self.fetchedEndPoint = bookid.key

                    }
                }
        }

