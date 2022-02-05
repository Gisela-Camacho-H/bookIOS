//
//  AuthorsViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class AuthorsViewController: UIViewController, AuthorManagerDelegate, UITextFieldDelegate {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var buscarLabel : UILabel?
    var SearchTextField: UITextField!
    var date : UILabel?
    var titleLabel : UILabel?
    var title1 : UILabel?
    var contentLabel : UILabel?
    var content1: UILabel?
    var contentLabel1 : UILabel?
    var content2: UILabel?
    var backButton : UIButton?
    
    var authorManager = AuthorManager()
    
    var backgroundColor = UIColor(displayP3Red: 255/255, green: 242/255, blue: 223/255, alpha: 1)
    var brownColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
    var pinkColor = UIColor(displayP3Red: 283/255, green: 162/255, blue: 129/255, alpha: 1)

    override func viewDidLoad() {
        super.viewDidLoad()

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        initUI()
            
        authorManager.delegate = self
        SearchTextField.delegate = self
           
    }
    func initUI(){
        
    backButton = UIButton(frame: CGRect(x: 20, y: 70, width: 45, height: 45))
    backButton?.setImage(UIImage(named: "back"), for: .normal)
    backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    view.addSubview(backButton!)
        
    buscarLabel = UILabel(frame: CGRect(x: 10, y: 90, width: width , height: 40))
    buscarLabel?.textAlignment = NSTextAlignment.center
    buscarLabel?.backgroundColor = .clear
    buscarLabel?.textColor = brownColor
    buscarLabel?.font = UIFont(name: "Arial Bold", size: 18)
    buscarLabel?.text = " ¡Ingresa el autor! "
    view.addSubview(buscarLabel!)

    SearchTextField = UITextField(frame: CGRect(x: 70, y: 150, width: width - 120 , height: 50))
    SearchTextField?.placeholder = "Nombre del autor"
    SearchTextField?.textAlignment = .center
    SearchTextField?.backgroundColor = .white
    SearchTextField?.layer.cornerRadius = 7
    SearchTextField?.layer.borderColor = UIColor.black.cgColor
    SearchTextField?.layer.borderWidth = 2
    view.addSubview(SearchTextField!)
    
    
        
        
    titleLabel = UILabel(frame: CGRect(x: 60, y: 230, width: width - 120 , height: 60))
    titleLabel?.textAlignment = NSTextAlignment.center
    titleLabel?.backgroundColor = brownColor
    titleLabel?.textColor = pinkColor
    titleLabel?.numberOfLines = 0
    titleLabel?.layer.cornerRadius = 7
    titleLabel?.font = UIFont(name: "Arial Bold", size: 25)
    titleLabel?.text = "Nombre del autor:"
    view.addSubview(titleLabel!)
        
    title1 = UILabel(frame: CGRect(x: 40, y: 300, width: width - 80 , height: 60))
    title1?.textAlignment = NSTextAlignment.center
    title1?.backgroundColor = .clear
    title1?.textColor = brownColor
    title1?.numberOfLines = 0
    title1?.font = UIFont(name: "Arial Bold", size: 20)
    title1?.text = ""
    view.addSubview(title1!)
        
    contentLabel = UILabel(frame: CGRect(x: 60, y: 380, width: width - 120 , height: 60))
    contentLabel?.textAlignment = NSTextAlignment.center
    contentLabel?.backgroundColor = brownColor
    contentLabel?.textColor = pinkColor
    contentLabel?.numberOfLines = 0
    contentLabel?.layer.cornerRadius = 7
    contentLabel?.font = UIFont(name: "Arial Bold", size: 25)
    contentLabel?.text = "Fecha de nacimiento:"
    view.addSubview(contentLabel!)
        
    content1 = UILabel(frame: CGRect(x: 40, y: 450, width: width - 80 , height: 60))
    content1?.textAlignment = NSTextAlignment.center
    content1?.backgroundColor = .clear
    content1?.textColor = brownColor
    content1?.numberOfLines = 0
    content1?.font = UIFont(name: "Arial Bold", size: 20)
    content1?.text = ""
    view.addSubview(content1!)
        
    contentLabel1 = UILabel(frame: CGRect(x: 60, y: 520, width: width - 120 , height: 60))
    contentLabel1?.textAlignment = NSTextAlignment.center
    contentLabel1?.backgroundColor = brownColor
    contentLabel1?.textColor = pinkColor
    contentLabel1?.numberOfLines = 0
    contentLabel1?.layer.cornerRadius = 7
    contentLabel1?.font = UIFont(name: "Arial Bold", size: 25)
    contentLabel1?.text = "Top - Work:"
    view.addSubview(contentLabel1!)
            
    content2 = UILabel(frame: CGRect(x: 40, y: 590, width: width - 80 , height: 60))
    content2?.textAlignment = NSTextAlignment.center
    content2?.backgroundColor = .clear
    content2?.textColor = brownColor
    content2?.numberOfLines = 0
    content2?.font = UIFont(name: "Arial Bold", size: 20)
    content2?.text = ""
    view.addSubview(content2!)

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
        authorManager.fetchAuthor(bookName: Name)
    }
    SearchTextField.text = ""
}
    func didUpdateAuthor(_ authorManager: AuthorManager, authorid: AuthorModel) {
        DispatchQueue.main.async {
            self.title1?.text = authorid.name
            //self.content1?.text = authorid.birthday
            self.content2?.text = authorid.top
            }

        }
}
