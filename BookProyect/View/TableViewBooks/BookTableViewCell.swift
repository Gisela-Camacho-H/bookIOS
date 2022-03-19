//
//  BookTableViewCell.swift
//  BookProyect
//
//  Created by GiselaCamacho on 23/01/22.
//

import Foundation
import UIKit

protocol MenuTableViewCellDelegate{
    func addtoCar(product: Books, count: Int)
    func removetoCar(product: Books, count: Int)
}

class BookTableViewCell: UITableViewCell{
    
    var ownContent: UIView?
    
    // Label
    lazy var bookName: UILabel = UILabel()
    lazy var bookAuthor: UILabel = UILabel()
    lazy var bookCategory: UILabel = UILabel()
    
    lazy var goButton: UIButton = UIButton()
    
    // UIImageView
    lazy var bookImage : UIImageView = UIImageView()
    
    var book: Books?
    var delegate: MenuTableViewCellDelegate?
    
    var count = 0
    var addButton: UIButton?
    var removeButton: UIButton?
    
    var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    init( book : Books, numberOf: Int){
        super.init(style: .default, reuseIdentifier: nil)
        self.book = book
        self.count = numberOf
        self.backgroundColor = .clear
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 40, height: height/7 - 15 ))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 15
        self.contentView.addSubview(ownContent!)
        
        
        bookName = UILabel(frame: CGRect(x: 80, y: 10, width: width/2, height: 20))
        bookName.text = book?.name
        bookName.textColor = UIColor.brownColor
        bookName.font = .boldSystemFont(ofSize: 15)
        bookName.textAlignment = .left
        ownContent?.addSubview(bookName)
        
        bookAuthor = UILabel(frame: CGRect(x: 80, y: 40, width: width/2, height: 20))
        bookAuthor.text = book?.author
        bookAuthor.textColor = UIColor.brownColor
        bookAuthor.font = .boldSystemFont(ofSize: 12)
        bookAuthor.textAlignment = .left
        bookAuthor.adjustsFontSizeToFitWidth = true
        ownContent?.addSubview(bookAuthor)
        
        bookCategory = UILabel(frame: CGRect(x: 80, y: 70, width: width/2, height: 20))
        bookCategory.text = book?.categories
        bookCategory.textColor = UIColor.brownColor
        bookCategory.font = .systemFont(ofSize: 12)
        ownContent?.addSubview(bookCategory)
        
        
        bookImage = UIImageView(frame: CGRect(x: 10, y: 5 , width: 60, height: 95)) //declaramos imagen
        bookImage.image = UIImage(named: book?.image ?? "") //asigna imagen
        bookImage.layer.cornerRadius = 10
        bookImage.layer.masksToBounds = true
        ownContent?.addSubview(bookImage)
        
        goButton = UIButton(frame: CGRect(x: Constants.width - 100, y: 10 , width: 35 , height: 35))
        goButton.setImage(UIImage(named: "go"), for: .normal);
        ownContent?.addSubview(goButton)
        
        addButton = UIButton(frame: CGRect(x: Constants.width - 130, y: 60, width: 30, height: 30))
        addButton?.backgroundColor = .white
        addButton?.setTitle(" + ", for: .normal)
        addButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        addButton?.setTitleColor(.DarkPinkColor, for: .normal)
        addButton?.layer.borderColor = UIColor.DarkPinkColor.cgColor
        addButton?.layer.borderWidth = 1
        addButton?.layer.cornerRadius = 5
        addButton?.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        ownContent?.addSubview(addButton!)
        
        ownContent?.addSubview(counterLabel)
        counterLabel.text = "\(count)"
        counterLabel.textColor = UIColor.brownColor
        counterLabel.addAnchorsAndSize(width: 20, height: 20, left: 5, top: 60, right: nil, bottom: nil, withAnchor: .left, relativeToView: addButton)
        
        removeButton = UIButton(frame: CGRect(x: Constants.width - 80, y: 60 , width: 30 , height: 30))
        removeButton?.backgroundColor = .white
        removeButton?.layer.borderColor = UIColor.DarkPinkColor.cgColor
        removeButton?.layer.borderWidth = 1
        removeButton?.layer.cornerRadius = 5
        removeButton?.setTitleColor(.DarkPinkColor, for: .normal)
        removeButton?.setTitle(" - ", for: .normal)
        removeButton?.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        removeButton?.addTarget(self, action: #selector(removeProduct), for: .touchUpInside)
        ownContent?.addSubview(removeButton!)
        
    }
    
    @objc func addProduct(){
        if count != 9 {
        count += 1
        print("ADD \(book?.name)")
        counterLabel.text = "\(count)"
        delegate?.addtoCar(product: book!, count: count)
        }
    }
    
    @objc func removeProduct(){
        if count != 0 {
            count -= 1
            print("Remove")
        counterLabel.text = "\(count)"
            delegate?.removetoCar(product: book!, count: count)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
