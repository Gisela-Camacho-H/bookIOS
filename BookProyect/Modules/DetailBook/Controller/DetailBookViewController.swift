//
//  DetailBookViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 22/01/22.
//

import UIKit

class DetailBookViewController: UIViewController {
    

    // UIViews
    lazy var bookContentView : UIView = UIView()
    lazy var bookCard : UIView  = UIView()
    lazy var descriptionView: UIView  = UIView()
    lazy var imageLine : UIView  = UIView()
    
    // UIImageView
    lazy var bookImage : UIImageView = UIImageView()
    lazy var topImageView : UIImageView = UIImageView()
    lazy var shareImage: UIImageView = UIImageView()
    lazy var heartImage: UIImageView = UIImageView()
    lazy var autorImage : UIImageView = UIImageView()
    
    // UILabels
    lazy var bookName: UILabel = UILabel()
    lazy var bookAutor : UILabel = UILabel()
    lazy var descriptionTextView : UILabel = UILabel()
    lazy var detailLabel : UILabel = UILabel()
    lazy var bookSobre: UILabel = UILabel()
    lazy var descriptionLabel : UILabel = UILabel()
    lazy var bookCategoria : UILabel = UILabel()
    lazy var bookMas: UILabel = UILabel()
    
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // UIButtons
    lazy var backButton : UIButton = UIButton()
    
    var mLibro: Libro?
    
    init(libro : Libro){
        self.mLibro = libro
        super.init(nibName: nil, bundle: nil)
         initUI()
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = backgroundColor
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "papel")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        initUI()
        
    }
    
    func initUI(){
   
    
        backButton = UIButton(frame: CGRect(x: 25, y: 65, width: 40, height: 40))
        backButton.setImage(UIImage(named: "back"), for: .normal)
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton)
        
        shareImage = UIImageView(frame: CGRect(x: width - 80, y: 70 , width: 23, height: 23))
        shareImage.image = UIImage(named: "share")
        view.addSubview(shareImage)
        
        heartImage = UIImageView(frame: CGRect(x: width - 45, y: 70 , width: 23, height: 23))
        heartImage.image = UIImage(named: "heart")
        view?.addSubview(heartImage)
        
        imageLine =  UIView(frame: CGRect(x: 0, y: 110 , width: width, height: 3))
        imageLine.backgroundColor = UIColor.brownColor
        view?.addSubview(imageLine)

        createBookView()
        createDescription()
        createSobreAutor()
    }

    //MARK: - imagen del libro e información
    func createBookView(){
        bookContentView = UIView(frame: CGRect(x: 25, y: height/7, width: width - 50, height: height/4))
        bookContentView.backgroundColor = .clear
        view.addSubview(bookContentView)
        
        
        bookCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 40, height: height/8))
        bookCard.backgroundColor = .white
        bookCard.layer.cornerRadius = 20
        bookContentView.addSubview(bookCard)
        
        
        bookImage = UIImageView(frame: CGRect(x: 20, y: 20, width: (width - 40)/3, height: height/4 - 30))
        bookImage.image = UIImage(named: mLibro?.imagen ?? "")

        bookContentView.addSubview(bookImage)
        
        
        bookName = UILabel(frame: CGRect(x: 160, y: 5, width: 180, height: 20))
        bookName.text = mLibro?.nombre
        bookName.textColor = UIColor.brownColor
        bookName.font = .boldSystemFont(ofSize: 17)
        
        bookCard.addSubview(bookName)
        
        
        bookAutor = UILabel(frame: CGRect(x: 160, y: 40, width: 160, height: 20))
        bookAutor.text = mLibro?.autor
        bookAutor.font = .boldSystemFont(ofSize: 12)
        
        bookCard.addSubview(bookAutor)
        
        bookCategoria = UILabel(frame: CGRect(x: 160, y: 70, width: 160, height: 20))
        bookCategoria.text = mLibro?.categoria
        bookCategoria.font = .boldSystemFont(ofSize: 12)
        
        bookCard.addSubview(bookCategoria)
    }
    
    
    // Activity indicator
    func createActivityIndicator() {
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
   // Función regresar

    @objc func backAction(){
        print("back")
        dismiss(animated: true)
    }
    
    //MARK: - Descripción del libro
    
    func createDescription(){
        descriptionView = UIView(frame: CGRect(x: 25, y: height/3 + 70, width: width - 50, height: height/5 + 20))
        descriptionView.backgroundColor = .white
        descriptionView.layer.cornerRadius = 20
        view.addSubview(descriptionView)
        
        descriptionLabel = UILabel(frame: CGRect(x: 10, y: 5, width: 160, height: 30))
        descriptionLabel.text = "Description"
        descriptionLabel.font = .boldSystemFont(ofSize: 14)
        descriptionLabel.textColor = UIColor.brownColor
        descriptionLabel.textAlignment = .center
        descriptionView.addSubview(descriptionLabel)
        
        detailLabel = UILabel(frame: CGRect(x: width/2 - 20, y: 5, width: 160, height: 30))
        detailLabel.text = "Details"
        detailLabel.textColor = UIColor.brownColor
        detailLabel.font = .boldSystemFont(ofSize: 14)
        detailLabel.textAlignment = .center
        descriptionView.addSubview(detailLabel)
        
        
        descriptionTextView = UILabel(frame: CGRect(x: 20, y: 50, width: width - 80, height: 100))
        descriptionTextView.text = mLibro?.descripcion
        descriptionTextView.numberOfLines = 0
        descriptionTextView.textAlignment = .left
        descriptionTextView.font = .boldSystemFont(ofSize: 13)
        descriptionView.addSubview(descriptionTextView)
        
        imageLine =  UIView(frame: CGRect(x: 180, y: 6 , width: 1, height: 30))
        imageLine.backgroundColor = UIColor.brownColor
        descriptionView.addSubview(imageLine)
        
    }
   // MARK: - Sobre el autor
    
    func createSobreAutor(){
        descriptionView = UIView(frame: CGRect(x: 25, y: height/2 + 140, width: width - 50, height: height/5 + 50))
        descriptionView.backgroundColor = .white
        descriptionView.layer.cornerRadius = 20
        view.addSubview(descriptionView)
        
        descriptionLabel = UILabel(frame: CGRect(x: width/4 + 20, y: 5, width: 160, height: 30))
        descriptionLabel.text = "About Author"
        descriptionLabel.textColor = UIColor.brownColor
        descriptionLabel.font = .boldSystemFont(ofSize: 15)
        descriptionLabel.textAlignment = .left
        descriptionView.addSubview(descriptionLabel)
        
        bookAutor = UILabel(frame: CGRect(x: width/4 + 20, y: 40, width: 250, height: 30))
        bookAutor.text = mLibro?.autor
        bookAutor.textColor = UIColor.brownColor
        bookAutor.font = .boldSystemFont(ofSize: 22)
        bookAutor.textAlignment = .left
        descriptionView.addSubview(bookAutor)
        
        bookSobre = UILabel(frame: CGRect(x: 20, y: 85, width: width - 80, height: 110))
        bookSobre.text = mLibro?.sobreAutor
        bookSobre.numberOfLines = 0
        bookSobre.textAlignment = .left
        bookSobre.font = .boldSystemFont(ofSize: 12)
        descriptionView.addSubview(bookSobre)
        
        bookMas = UILabel(frame: CGRect(x: 260, y: 200 , width: 140, height: 20))
        bookMas.text = "+ author titles"
        bookMas.textColor = UIColor.coralColor
        bookMas.font = .boldSystemFont(ofSize: 12)
        descriptionView.addSubview(bookMas)
        
        autorImage = UIImageView(frame: CGRect(x: 25, y: 10, width: 70, height: 70))
        autorImage.image = UIImage(named: mLibro?.autorImage ?? "")
        autorImage.layer.cornerRadius = 35
        autorImage.layer.masksToBounds = true
        descriptionView.addSubview(autorImage)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
