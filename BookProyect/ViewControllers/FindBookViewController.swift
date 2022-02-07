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
    var contentLabel1 : UILabel?
    var content1: UILabel?
    var contentLabel2 : UILabel?
    var content2: UILabel?
    var contentLabel3 : UILabel?
    var content3: UILabel?
    var showLabel: UILabel?
    var goBookButton: UIButton?
    var backButton: UIButton?
    
    var fetchedEndPoint : String?
    
    var bookManager = BookManager()
    
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
            
        bookManager.delegate = self
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
            buscarLabel?.text = " Enter the book's name "
            view.addSubview(buscarLabel!)
        
            SearchTextField = UITextField(frame: CGRect(x: 70, y: 220, width: width - 120 , height: 50))
            SearchTextField?.placeholder = " Book Name "
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
            titleLabel?.layer.cornerRadius = 10
            titleLabel?.font = UIFont(name: "Arial Bold", size: 25)
            titleLabel?.text = "Book Name:"
            view.addSubview(titleLabel!)
                
            title1 = UILabel(frame: CGRect(x: 40, y: 350, width: width - 80 , height: 50))
            title1?.textAlignment = NSTextAlignment.center
            title1?.backgroundColor = .clear
            title1?.textColor = brownColor
            title1?.numberOfLines = 0
            title1?.font = UIFont(name: "Arial Bold", size: 20)
            title1?.text = ""
            view.addSubview(title1!)
                
            contentLabel1 = UILabel(frame: CGRect(x: 60, y: 410, width: width - 120 , height: 50))
            contentLabel1?.textAlignment = NSTextAlignment.center
            contentLabel1?.backgroundColor = brownColor
            contentLabel1?.textColor = pinkColor
            contentLabel1?.numberOfLines = 0
            contentLabel1?.layer.cornerRadius = 10
            contentLabel1?.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel1?.text = "First Publish Year:"
            view.addSubview(contentLabel1!)
                
            content1 = UILabel(frame: CGRect(x: 40, y: 460, width: width - 80 , height: 50))
            content1?.textAlignment = NSTextAlignment.center
            content1?.backgroundColor = .clear
            content1?.textColor = brownColor
            content1?.numberOfLines = 0
            content1?.font = UIFont(name: "Arial Bold", size: 20)
            content1?.text = ""
            view.addSubview(content1!)
                
            contentLabel2 = UILabel(frame: CGRect(x: 60, y: 510, width: width - 120 , height: 50))
            contentLabel2?.textAlignment = NSTextAlignment.center
            contentLabel2?.backgroundColor = brownColor
            contentLabel2?.textColor = pinkColor
            contentLabel2?.numberOfLines = 0
            contentLabel2?.layer.cornerRadius = 10
            contentLabel2?.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel2?.text = "Author Name:"
            view.addSubview(contentLabel2!)
                    
            content2 = UILabel(frame: CGRect(x: 40, y: 560, width: width - 80 , height: 50))
            content2?.textAlignment = NSTextAlignment.center
            content2?.backgroundColor = .clear
            content2?.textColor = brownColor
            content2?.numberOfLines = 0
            content2?.font = UIFont(name: "Arial Bold", size: 20)
            content2?.text = ""
            view.addSubview(content2!)
                    
            contentLabel3 = UILabel(frame: CGRect(x: 60, y: 610, width: width - 120 , height: 50))
            contentLabel3?.textAlignment = NSTextAlignment.center
            contentLabel3?.backgroundColor = brownColor
            contentLabel3?.textColor = pinkColor
            contentLabel3?.numberOfLines = 0
            contentLabel3?.layer.cornerRadius = 10
            contentLabel3?.font = UIFont(name: "Arial Bold", size: 25)
            contentLabel3?.text = "Author Id:"
            view.addSubview(contentLabel3!)
                        
            content3 = UILabel(frame: CGRect(x: 40, y: 660, width: width - 80 , height: 50))
            content3?.textAlignment = NSTextAlignment.center
            content3?.backgroundColor = .clear
            content3?.textColor = brownColor
            content3?.numberOfLines = 0
            content3?.font = UIFont(name: "Arial Bold", size: 20)
            content3?.text = ""
            view.addSubview(content3!)
                    
                
            showLabel = UILabel(frame: CGRect(x: width - 140, y: height - 90, width: 70 , height: 40))
            showLabel?.textAlignment = NSTextAlignment.center
                showLabel?.backgroundColor = pinkColor
            showLabel?.textColor = brownColor
            showLabel?.numberOfLines = 0
            showLabel?.font = UIFont(name: "Arial Bold", size: 22)
            showLabel?.text = "+ info"
            showLabel?.layer.cornerRadius = 7
            view.addSubview(showLabel!)
                
            goBookButton = UIButton(frame: CGRect(x: width - 70, y: height - 95, width: 50 , height: 50))
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
        register.endPointKey = fetchedEndPoint
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
                    self.content2?.text = bookid.author_name
                    self.content3?.text = bookid.author_key
                    self.fetchedEndPoint = bookid.key

                    }

                }
        }

