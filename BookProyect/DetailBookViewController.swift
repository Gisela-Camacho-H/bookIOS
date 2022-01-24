//
//  DetailBookViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 22/01/22.
//

import UIKit

class DetailBookViewController: UIViewController {
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var topImageView : UIImageView?
    
    var bookContentView : UIView?
    var bookImage : UIImageView?
    var bookCard : UIView?
    var bookName: UILabel?
    var bookAutor : UILabel?
    var backButton : UIButton?
    var descriptionView: UIView?
    var descriptionTextView : UILabel?
    var bookCategoria : UILabel?
    var detailLabel : UILabel?
    var bookSobre: UILabel?
    var descriptionLabel : UILabel?
    var imageLine : UIView?
    var bookMas: UILabel?
    var mLibro: Libro?
    var shareImage: UIImageView?
    var heartImage: UIImageView?
    
    
    var backgroundColor = UIColor(displayP3Red: 220/255, green: 218/255, blue: 220/255, alpha: 1) //rgba(220,218,220,255)
    var blueColor = UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1)
    var lightBlueColor = UIColor(displayP3Red: 121/255, green: 168/255, blue: 243/255, alpha: 1)
    
    init(libro : Libro){
        self.mLibro = libro
        super.init(nibName: nil, bundle: nil)
         initUI()
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = backgroundColor
        
        initUI()
        
    }
    
    func initUI(){
        
        topImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height/4))
        topImageView?.image = UIImage(named: "topimage")
        view.addSubview(topImageView!)
        
    
        backButton = UIButton(frame: CGRect(x: 25, y: 56, width: 30, height: 30))
        backButton?.setImage(UIImage(named: "back"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
        
        shareImage = UIImageView(frame: CGRect(x: width - 80, y: 58 , width: 23, height: 23))
        shareImage?.image = UIImage(named: "share")
        view.addSubview(shareImage!)
        
        heartImage = UIImageView(frame: CGRect(x: width - 45, y: 58 , width: 23, height: 23))
        heartImage?.image = UIImage(named: "heart")
        view?.addSubview(heartImage!)
        
        imageLine =  UIView(frame: CGRect(x: 0, y: 90 , width: width, height: 3))
        imageLine?.backgroundColor = blueColor
        view?.addSubview(imageLine!)

        createBookView()
        createDescription()
        createSobreAutor()
    }
    
    func createBookView(){
        bookContentView = UIView(frame: CGRect(x: 25, y: height/7, width: width - 50, height: height/4))
        bookContentView?.backgroundColor = .clear
        view.addSubview(bookContentView!)
        
        
        bookCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 40, height: height/8))
        bookCard?.backgroundColor = .white
        bookCard?.layer.cornerRadius = 20
        bookContentView?.addSubview(bookCard!)
        
        
        bookImage = UIImageView(frame: CGRect(x: 20, y: 20, width: (width - 40)/3, height: height/4 - 30))
        bookImage?.image = UIImage(named: mLibro?.imagen ?? "")

        bookContentView?.addSubview(bookImage!)
        
        
        bookName = UILabel(frame: CGRect(x: 150, y: 5, width: 180, height: 20))
        bookName?.text = mLibro?.nombre
        bookName?.textColor = blueColor
        bookName?.font = .boldSystemFont(ofSize: 17)
        
        bookCard?.addSubview(bookName!)
        
        
        bookAutor = UILabel(frame: CGRect(x: 150, y: 40, width: 160, height: 20))
        bookAutor?.text = mLibro?.autor
        bookAutor?.font = .boldSystemFont(ofSize: 12)
        
        bookCard?.addSubview(bookAutor!)
        
        bookCategoria = UILabel(frame: CGRect(x: 150, y: 70, width: 160, height: 20))
        bookCategoria?.text = mLibro?.categoria
        bookCategoria?.font = .boldSystemFont(ofSize: 12)
        
        bookCard?.addSubview(bookCategoria!)
    }
    
    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
    
    
    func createDescription(){
        descriptionView = UIView(frame: CGRect(x: 25, y: height/3 + 80, width: width - 50, height: height/5 + 20))
        descriptionView?.backgroundColor = .white
        descriptionView?.layer.cornerRadius = 20
        view.addSubview(descriptionView!)
        
        descriptionLabel = UILabel(frame: CGRect(x: 10, y: 5, width: 160, height: 30))
        descriptionLabel?.text = "Descripción"
        descriptionLabel?.font = .boldSystemFont(ofSize: 14)
        descriptionLabel?.textColor = blueColor
        descriptionLabel?.textAlignment = .center
        descriptionView?.addSubview(descriptionLabel!)
        
        detailLabel = UILabel(frame: CGRect(x: width/2 - 20, y: 5, width: 160, height: 30))
        detailLabel?.text = "Detalles"
        detailLabel?.textColor = blueColor
        detailLabel?.font = .boldSystemFont(ofSize: 14)
        detailLabel?.textAlignment = .center
        descriptionView?.addSubview(detailLabel!)
        
        
        descriptionTextView = UILabel(frame: CGRect(x: 20, y: 50, width: width - 80, height: 100))
        descriptionTextView?.text = mLibro?.descripcion
        descriptionTextView?.numberOfLines = 0
        descriptionTextView?.textAlignment = .left
        descriptionTextView?.font = .boldSystemFont(ofSize: 13)
        descriptionView?.addSubview(descriptionTextView!)
        
        imageLine =  UIView(frame: CGRect(x: 180, y: 6 , width: 1, height: 30))
        imageLine?.backgroundColor = blueColor
        descriptionView?.addSubview(imageLine!)
        
    }
    
    func createSobreAutor(){
        descriptionView = UIView(frame: CGRect(x: 25, y: height/2 + 160, width: width - 50, height: height/5 + 50))
        descriptionView?.backgroundColor = .white
        descriptionView?.layer.cornerRadius = 20
        view.addSubview(descriptionView!)
        
        descriptionLabel = UILabel(frame: CGRect(x: width/4 + 20, y: 5, width: 160, height: 30))
        descriptionLabel?.text = "Sobre el Autor"
        descriptionLabel?.textColor = blueColor
        descriptionLabel?.font = .boldSystemFont(ofSize: 15)
        descriptionLabel?.textAlignment = .left
        descriptionView?.addSubview(descriptionLabel!)
        
        bookAutor = UILabel(frame: CGRect(x: width/4 + 20, y: 40, width: 250, height: 30))
        bookAutor?.text = mLibro?.autor
        bookAutor?.textColor = blueColor
        bookAutor?.font = .boldSystemFont(ofSize: 22)
        bookAutor?.textAlignment = .left
        descriptionView?.addSubview(bookAutor!)
        
        bookSobre = UILabel(frame: CGRect(x: 20, y: 70, width: width - 80, height: 120))
        bookSobre?.text = mLibro?.sobreAutor
        bookSobre?.numberOfLines = 0
        bookSobre?.textAlignment = .left
        bookSobre?.font = .boldSystemFont(ofSize: 12)
        descriptionView?.addSubview(bookSobre!)
        
        bookMas = UILabel(frame: CGRect(x: 200, y: 180 , width: 140, height: 20))
        bookMas?.text = "Más titulos del autor"
        bookMas?.textColor = lightBlueColor
        bookMas?.font = .boldSystemFont(ofSize: 12)
        descriptionView?.addSubview(bookMas!)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}