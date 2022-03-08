//
//  FinderViewController.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/03/22.
//

import UIKit

class FinderViewController: UIViewController {
    
    lazy var findLabel: UILabel = UILabel()
    
    // Buttons
    lazy var booksButton: UIButton = UIButton()
    lazy var categoriesButton: UIButton = UIButton()
    lazy var authorsButton: UIButton = UIButton()
    
    lazy var ButtonStackView: UIStackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        // Do any additional setup after loading the view.
    }
    
    func initUI(){
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "background")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
        findLabel = UILabel(frame: CGRect(x: 0, y: 180, width: width, height: 50))
        findLabel.text = "Find by: "
        findLabel.font = .boldSystemFont(ofSize: 35)
        findLabel.textAlignment = .center
        findLabel.textColor = UIColor.brownColor
        view.addSubview(findLabel)
        
        self.view.addSubview(booksButton)
        self.view.addSubview(categoriesButton)
        self.view.addSubview(authorsButton)
        
        let buttonArray: [UIButton] = [booksButton, categoriesButton, authorsButton]
        
        ButtonStackView.axis = .vertical
        ButtonStackView.spacing = 50
        ButtonStackView.alignment = .fill
        ButtonStackView.distribution = .fillEqually
        buttonArray.forEach {button in
            ButtonStackView.addArrangedSubview(button)
        }
        view.addSubview(ButtonStackView)
        ButtonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([ButtonStackView.topAnchor.constraint(equalTo: findLabel.topAnchor, constant: 90),
        ButtonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ButtonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8)
        ])
        buttonArray.forEach {button in
            button.backgroundColor = UIColor.brownColor
            button.layer.cornerRadius = 23
            button.setTitleColor(.white, for: .normal)
            button.heightAnchor.constraint(equalToConstant: 60).isActive = true
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
            
        }
        
        booksButton.setTitle("Books", for: .normal)
        booksButton.addTarget(self, action: #selector(books), for: .touchUpInside)
        categoriesButton.setTitle("Categories", for: .normal)
        categoriesButton.addTarget(self, action: #selector(categories), for: .touchUpInside)
        authorsButton.setTitle("Authors", for: .normal)
        authorsButton.addTarget(self, action: #selector(authors), for: .touchUpInside)
        
        
    }

    @objc func books (){
        print("Books")
         let register = FindBookViewController()
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
    @objc func categories (){
        print("Categories")
         let register = CategoriesViewController()
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
    @objc func authors (){
        print("Authors")
         let register = AuthorsViewController()
        register.modalPresentationStyle = .fullScreen
        present(register, animated: true, completion: nil)
    }
}