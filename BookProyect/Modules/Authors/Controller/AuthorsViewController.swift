//
//  AuthorsViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class AuthorsViewController: UIViewController, AuthorManagerDelegate, UITextFieldDelegate {
    
    // Labels
    lazy var buscarLabel : UILabel = UILabel()
    lazy var date : UILabel = UILabel()
    lazy var titleLabel : UILabel = UILabel()
    lazy var title1 : UILabel = UILabel()
    lazy var contentLabel : UILabel = UILabel()
    lazy var content1: UILabel = UILabel()
    lazy var contentLabel1 : UILabel = UILabel()
    lazy var content2: UILabel = UILabel()
    lazy var contentLabel2 : UILabel = UILabel()
    lazy var content3: UILabel = UILabel()
    
    // Buttons
    var goBookButton : UIButton = UIButton()
    lazy var backButton: UIButton = UIButton()
    
    var SearchTextField: UITextField!
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
    buscarLabel.text = " Enter the Author's Name  "
    view.addSubview(buscarLabel)

    SearchTextField = UITextField(frame: CGRect(x: 70, y: 220, width: width - 120 , height: 50))
    SearchTextField.placeholder = "Author Name"
    SearchTextField.textAlignment = .center
    SearchTextField.backgroundColor = .white
    SearchTextField.layer.cornerRadius = 7
    SearchTextField.layer.borderColor = UIColor.black.cgColor
    SearchTextField.layer.borderWidth = 2
    view.addSubview(SearchTextField)
        
    titleLabel = UILabel(frame: CGRect(x: 60, y: 290, width: width - 120 , height: 50))
    titleLabel.textAlignment = NSTextAlignment.center
    titleLabel.backgroundColor = UIColor.brownColor
    titleLabel.textColor = UIColor.pinkColor
    titleLabel.numberOfLines = 0
    titleLabel.layer.cornerRadius = 7
    titleLabel.font = UIFont(name: "Arial Bold", size: 25)
    titleLabel.text = "Author Full Name:"
    view.addSubview(titleLabel)
        
    title1 = UILabel(frame: CGRect(x: 40, y: 350, width: width - 80 , height: 50))
    title1.textAlignment = NSTextAlignment.center
    title1.backgroundColor = .clear
    title1.textColor = UIColor.brownColor
    title1.numberOfLines = 0
    title1.font = UIFont(name: "Arial Bold", size: 20)
    title1.text = ""
    view.addSubview(title1)
        
    contentLabel = UILabel(frame: CGRect(x: 60, y: 410, width: width - 120 , height: 50))
    contentLabel.textAlignment = NSTextAlignment.center
    contentLabel.backgroundColor = UIColor.brownColor
    contentLabel.textColor = UIColor.pinkColor
    contentLabel.numberOfLines = 0
    contentLabel.layer.cornerRadius = 7
    contentLabel.font = UIFont(name: "Arial Bold", size: 25)
    contentLabel.text = "Author Id:"
    view.addSubview(contentLabel)
        
    content1 = UILabel(frame: CGRect(x: 40, y: 470, width: width - 80 , height: 50))
    content1.textAlignment = NSTextAlignment.center
    content1.backgroundColor = .clear
    content1.textColor = UIColor.brownColor
    content1.numberOfLines = 0
    content1.font = UIFont(name: "Arial Bold", size: 20)
    content1.text = ""
    view.addSubview(content1)
        
    contentLabel1 = UILabel(frame: CGRect(x: 60, y: 520, width: width - 120 , height: 50))
    contentLabel1.textAlignment = NSTextAlignment.center
    contentLabel1.backgroundColor = UIColor.brownColor
    contentLabel1.textColor = UIColor.pinkColor
    contentLabel1.numberOfLines = 0
    contentLabel1.layer.cornerRadius = 7
    contentLabel1.font = UIFont(name: "Arial Bold", size: 25)
    contentLabel1.text = "Top - Work:"
    view.addSubview(contentLabel1)
            
    content2 = UILabel(frame: CGRect(x: 40, y: 580, width: width - 80 , height: 50))
    content2.textAlignment = NSTextAlignment.center
    content2.backgroundColor = .clear
    content2.textColor = UIColor.brownColor
    content2.numberOfLines = 0
    content2.font = UIFont(name: "Arial Bold", size: 20)
    content2.text = ""
    view.addSubview(content2)
        
    contentLabel2 = UILabel(frame: CGRect(x: 60, y: 640, width: width - 120 , height: 50))
    contentLabel2.textAlignment = NSTextAlignment.center
    contentLabel2.backgroundColor = UIColor.brownColor
    contentLabel2.textColor = UIColor.pinkColor
    contentLabel2.numberOfLines = 0
    contentLabel2.layer.cornerRadius = 7
    contentLabel2.font = UIFont(name: "Arial Bold", size: 25)
    contentLabel2.text = "Birthday:"
    view.addSubview(contentLabel2)
                
    content3 = UILabel(frame: CGRect(x: 40, y: 700, width: width - 80 , height: 50))
    content3.textAlignment = NSTextAlignment.center
    content3.backgroundColor = .clear
    content3.textColor = UIColor.brownColor
    content3.numberOfLines = 0
    content3.font = UIFont(name: "Arial Bold", size: 20)
    content3.text = ""
    view.addSubview(content3)
        
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
        authorManager.fetchAuthor(bookName: Name)
        creaeActivityIndicator()
    }
    SearchTextField.text = ""
}
    func didUpdateAuthor(_ authorManager: AuthorManager, authorid: AuthorModel) {
        DispatchQueue.main.async {
            self.activityView.removeFromSuperview()
            self.activityView.stopAnimating()
            self.title1.text = authorid.name
            self.content3.text = authorid.birthday ?? ""
            self.content2.text = authorid.top ?? ""
            self.content1.text = authorid.key
            self.fetchedEndPoint = authorid.key
            self.nameEndPoint = authorid.name
            }

        }
}
