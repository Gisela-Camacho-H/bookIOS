//
//  AuthorsViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class AuthorsViewController: UIViewController, AuthorManagerDelegate, UITextFieldDelegate {
    
    // Labels
    lazy var findLabel : UIView.findLabel = UIView.findLabel()
    
    lazy var titleText: UIView.clearLabels = UIView.clearLabels()
    lazy var contentText: UIView.clearLabels = UIView.clearLabels()
    lazy var contentText1: UIView.clearLabels = UIView.clearLabels()
    lazy var contentText2: UIView.clearLabels = UIView.clearLabels()
    
    lazy var titleLabel : UIView.brownLabels = UIView.brownLabels()
    lazy var contentLabel1 :UIView.brownLabels = UIView.brownLabels()
    lazy var contentLabel2 : UIView.brownLabels = UIView.brownLabels()
    lazy var contentLabel3 : UIView.brownLabels = UIView.brownLabels()
    
    // Buttons
    var goBookButton : UIButton = UIButton()
    lazy var backButton: UIButton = UIButton()
    
    // stacksView
    lazy var labelStackView: UIStackView = UIStackView()
    lazy var labelStackView1: UIStackView = UIStackView()
    
    var searchTextField: UIView.findTextField = UIView.findTextField()
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    var fetchedEndPoint : String?
    var nameEndPoint: String?
    
    var authorManager = AuthorManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        initUI()
            
        authorManager.delegate = self
        searchTextField.delegate = self
        
    }
    
    func initUI(){
        
    backButton = UIButton(frame: CGRect(x: 25, y: height/7 - 60, width: 45, height: 45))
    backButton.setImage(UIImage(named: "back"), for: .normal)
    backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    view.addSubview(backButton)
        
    findLabel = UIView.findLabel(frame: CGRect(x: 10, y: 170, width: width , height: 40))
    findLabel.text = " Enter the Author's Name  "
    view.addSubview(findLabel)

    searchTextField = UIView.findTextField(frame: CGRect(x: 70, y: 220, width: width - 120 , height: 50))
    searchTextField.placeholder = "Author Name"
    view.addSubview(searchTextField)
        
    self.view.addSubview(titleLabel)
    self.view.addSubview(contentLabel1)
    self.view.addSubview(contentLabel2)
    self.view.addSubview(contentLabel3)
    titleLabel.text = "Author Full Name:"
    contentLabel1.text = "Author Id:"
    contentLabel2.text = "Top - Work:"
    contentLabel3.text = "Birthday:"
        
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
                label1.textAlignment = .center
            }
        
    goBookButton = UIButton(frame: CGRect(x: width - 90, y: height - 200, width: 70 , height: 50))
    goBookButton.setTitle("+ info", for: .normal)
    goBookButton.setTitleColor(.brownColor, for: .normal)
    goBookButton.addTarget(self, action: #selector(go), for: .touchUpInside)
    goBookButton.titleLabel?.font = UIFont(name: "GillSans-Bold", size: 20)
    view.addSubview(goBookButton)

}
    func creaeActivityIndicator() {
        self.view.addSubview(activityView)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.color = UIColor.brownColor
        activityView.backgroundColor = .white
        NSLayoutConstraint.activate([
            activityView.centerXAnchor.constraint(equalTo: view.centerXAnchor), activityView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
        activityView.startAnimating()
    }

    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
    
    @objc func go (){
        print("go to this book")
         let register = DetailAuthorViewController()
        register.endPointKey = fetchedEndPoint
        register.nameAuthor = nameEndPoint
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
        authorManager.fetchAuthor(authorName: Name)
        creaeActivityIndicator()
    }
    searchTextField.text = ""
}
    func didUpdateAuthor(_ authorManager: AuthorManager, authorid: AuthorModel) {
        DispatchQueue.main.async {
            self.activityView.removeFromSuperview()
            self.activityView.stopAnimating()
            self.titleText.text = authorid.name
            self.contentText.text = authorid.birthday ?? ""
            self.contentText1.text = authorid.top ?? ""
            self.contentText2.text = authorid.key
            self.fetchedEndPoint = authorid.key
            self.nameEndPoint = authorid.name
            }

        }
}
