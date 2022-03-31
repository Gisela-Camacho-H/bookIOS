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
    lazy var authorImage : UIImageView = UIImageView()
    
    // UILabels
    lazy var bookName: UILabel = UILabel()
    lazy var authorBook : UILabel = UILabel()
    lazy var descriptionTextView : UILabel = UILabel()
    lazy var detailLabel : UILabel = UILabel()
    lazy var aboutAuthor: UILabel = UILabel()
    lazy var descriptionLabel : UILabel = UILabel()
    lazy var bookCategory : UILabel = UILabel()
    lazy var moreBooks: UILabel = UILabel()
    
    private lazy var activityView: UIActivityIndicatorView = UIActivityIndicatorView()
    
    // UIButtons
    lazy var backButton : UIButton = UIButton()
    
    var mBook: Books?
    
    init(book : Books){
        self.mBook = book
        super.init(nibName: nil, bundle: nil)
         initUI()
     }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //view.backgroundColor = backgroundColor
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "paper")
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
        bookImage.image = UIImage(named: mBook?.image ?? "")

        bookContentView.addSubview(bookImage)
        
        
        bookName = UILabel(frame: CGRect(x: 150, y: 5, width: Constants.width - 200, height: 60))
        bookName.text = mBook?.name
        bookName.numberOfLines = 0
        bookName.textAlignment = .center
        bookName.textColor = UIColor.brownColor
        bookName.apply17Font()
        
        bookCard.addSubview(bookName)
        
        
        authorBook = UILabel(frame: CGRect(x: 160, y: 60, width: 160, height: 20))
        authorBook.text = mBook?.author
        authorBook.apply13Font()
        authorBook.textColor = UIColor.brownColor
        bookCard.addSubview(authorBook)
        
        bookCategory = UILabel(frame: CGRect(x: 160, y: 80, width: 160, height: 20))
        bookCategory.text = mBook?.categories
        bookCategory.textColor = UIColor.brownColor
        bookCategory.apply13Font()
        
        bookCard.addSubview(bookCategory)
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
        descriptionLabel.apply17Font()
        descriptionLabel.textColor = UIColor.brownColor
        descriptionLabel.textAlignment = .center
        descriptionView.addSubview(descriptionLabel)
        
        detailLabel = UILabel(frame: CGRect(x: width/2 - 20, y: 5, width: 160, height: 30))
        detailLabel.text = "Details"
        detailLabel.textColor = UIColor.brownColor
        detailLabel.apply17Font()
        detailLabel.textAlignment = .center
        descriptionView.addSubview(detailLabel)
        
        
        descriptionTextView = UILabel(frame: CGRect(x: 20, y: 50, width: width - 90, height: 100))
        descriptionTextView.text = mBook?.description
        descriptionTextView.numberOfLines = 0
        descriptionTextView.textAlignment = .justified
        descriptionTextView.textColor = UIColor.brownColor
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
        descriptionLabel.apply17Font()
        descriptionLabel.textAlignment = .left
        descriptionView.addSubview(descriptionLabel)
        
        authorBook = UILabel(frame: CGRect(x: width/4 + 20, y: 40, width: 250, height: 30))
        authorBook.text = mBook?.author
        authorBook.textColor = UIColor.brownColor
        authorBook.apply20Font()
        authorBook.textAlignment = .left
        descriptionView.addSubview(authorBook)
        
        aboutAuthor = UILabel(frame: CGRect(x: 20, y: 85, width: width - 90, height: 110))
        aboutAuthor.text = mBook?.aboutAuthor
        aboutAuthor.numberOfLines = 0
        aboutAuthor.textColor = UIColor.brownColor
        aboutAuthor.textAlignment = .justified
        aboutAuthor.font = .boldSystemFont(ofSize: 12)
        descriptionView.addSubview(aboutAuthor )
        
        moreBooks = UILabel(frame: CGRect(x: Constants.width - 150, y: Constants.height/5 + 25 , width: 140, height: 20))
        moreBooks.text = "+ author titles"
        moreBooks.textColor = UIColor.coralColor
        moreBooks.apply13Font()
        descriptionView.addSubview(moreBooks)
        
        authorImage = UIImageView(frame: CGRect(x: 25, y: 10, width: 70, height: 70))
        authorImage.image = UIImage(named: mBook?.imageAuthor ?? "")
        authorImage.layer.cornerRadius = 35
        authorImage.layer.masksToBounds = true
        descriptionView.addSubview(authorImage)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
