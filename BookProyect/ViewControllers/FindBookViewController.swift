//
//  FindBookViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 02/02/22.
//

import UIKit

class FindBookViewController: UIViewController, BookManagerDelegate, UITextFieldDelegate{
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var buscarLabel : UILabel?
    var SearchTextField: UITextField!
    var date : UILabel?
    var titleLabel : UILabel?
    var title1 : UILabel?
    var contentLabel : UILabel?
    var content1: UILabel?
    var showLabel: UILabel?
    var goBookButton: UIButton?
    var backButton: UIButton?
    
    var bookManager = BookManager()
    
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
            
        bookManager.delegate = self
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
            buscarLabel?.text = " ¡Ingresa el nombre del libro! "
            view.addSubview(buscarLabel!)
        
            SearchTextField = UITextField(frame: CGRect(x: 70, y: 150, width: width - 120 , height: 50))
            SearchTextField?.placeholder = "Nombre del libro"
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
            titleLabel?.text = "Nombre del libro:"
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
            contentLabel?.text = "Año de primera publicación:"
            view.addSubview(contentLabel!)
                
            content1 = UILabel(frame: CGRect(x: 40, y: 450, width: width - 80 , height: 60))
            content1?.textAlignment = NSTextAlignment.center
            content1?.backgroundColor = .clear
            content1?.textColor = brownColor
            content1?.numberOfLines = 0
            content1?.font = UIFont(name: "Arial Bold", size: 20)
            content1?.text = ""
            view.addSubview(content1!)
                
            showLabel = UILabel(frame: CGRect(x: width - 200, y: 600, width: 100 , height: 60))
            showLabel?.textAlignment = NSTextAlignment.center
            showLabel?.backgroundColor = backgroundColor
            showLabel?.textColor = pinkColor
            showLabel?.numberOfLines = 0
            showLabel?.layer.cornerRadius = 7
            showLabel?.font = UIFont(name: "Arial Bold", size: 25)
            showLabel?.text = "+ info"
            view.addSubview(showLabel!)
                
            goBookButton = UIButton(frame: CGRect(x: width - 100, y: 600, width: 60 , height: 60))
            goBookButton?.setImage(UIImage(named: "go"), for: .normal);
            goBookButton?.addTarget(self, action: #selector(go), for: .touchUpInside)
            view.addSubview(goBookButton!)

    }
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
        
    @objc func go (){
        print("go to this book")
         let register = DetailFindBookViewController()
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
                bookManager.fetchBook(bookName: Name)
            }
            SearchTextField.text = ""
        }
            func didUpdateBook(_ bookManager: BookManager, bookid: BookModel) {
                DispatchQueue.main.async {
                    self.title1?.text = String(bookid.title)
                    self.content1?.text = String(bookid.first ?? 0)

                    }

                }
        }

