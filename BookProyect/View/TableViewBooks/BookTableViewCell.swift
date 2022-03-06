//
//  BookTableViewCell.swift
//  BookProyect
//
//  Created by GiselaCamacho on 23/01/22.
//

import Foundation
import UIKit

protocol MenuTableViewCellDelegate{
    func addtoCar(product: Libro, count: Int)
    func removetoCar(product: Libro, count: Int)
}

class BookTableViewCell: UITableViewCell{
    
    var ownContent: UIView?
    
    // Label
    lazy var nameBook: UILabel = UILabel()
    lazy var autorLibro: UILabel = UILabel()
    lazy var categoriaLibro : UILabel = UILabel()
    
    lazy var goButton: UIButton = UIButton()
    
    // UIImageView
    lazy var imageLibro : UIImageView = UIImageView()
    lazy var shareImage: UIImageView  = UIImageView()
    lazy var heartImage: UIImageView  = UIImageView()
    
    var libro: Libro?
    var delegate: MenuTableViewCellDelegate?
    
    var count = 0
    var addButton: UIButton?
    var removeButton: UIButton?
    
    var counterLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        return label
    }()
    
    init(libro : Libro, numberOf: Int){
        super.init(style: .default, reuseIdentifier: nil)
        self.libro = libro
        self.count = numberOf
        self.backgroundColor = .clear
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 40, height: height/7 - 15 ))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 15
        self.contentView.addSubview(ownContent!)
        
        
        nameBook = UILabel(frame: CGRect(x: 100, y: 20, width: width/2, height: 20))
        nameBook.text = libro?.nombre
        nameBook.font = .boldSystemFont(ofSize: 15)
        nameBook.textAlignment = .left
        ownContent?.addSubview(nameBook)
        
        autorLibro = UILabel(frame: CGRect(x: 100, y: 55, width: width/2, height: 20))
        autorLibro.text = libro?.autor
        autorLibro.font = .boldSystemFont(ofSize: 12)
        autorLibro.textAlignment = .left
        autorLibro.adjustsFontSizeToFitWidth = true
        ownContent?.addSubview(autorLibro)
        
        categoriaLibro = UILabel(frame: CGRect(x: 100, y: 80, width: width/2, height: 20))
        categoriaLibro.text = libro?.categoria
        categoriaLibro.font = .systemFont(ofSize: 12)
        ownContent?.addSubview(categoriaLibro)
        
        
        imageLibro = UIImageView(frame: CGRect(x: 20, y: 5 , width: 60, height: 95)) //declaramos imagen
        imageLibro.image = UIImage(named: libro?.imagen ?? "") //asigna imagen
        imageLibro.layer.cornerRadius = 10
        imageLibro.layer.masksToBounds = true
        ownContent?.addSubview(imageLibro)
        
        goButton = UIButton(frame: CGRect(x: 295, y: 10 , width: 40 , height: 30))
        goButton.setImage(UIImage(named: "go"), for: .normal);
        ownContent?.addSubview(goButton)
        
        shareImage = UIImageView(frame: CGRect(x: 290, y: 50 , width: 17, height: 17))
        shareImage.image = UIImage(named: "share")
        ownContent?.addSubview(shareImage)
        
        heartImage = UIImageView(frame: CGRect(x: 320, y: 50 , width: 17, height: 17))
        heartImage.image = UIImage(named: "heart")
        ownContent?.addSubview(heartImage)
        
        addButton = UIButton(frame: CGRect(x: 280, y: 80, width: 30, height: 30))
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
        counterLabel.addAnchorsAndSize(width: 20, height: 20, left: 5, top: nil, right: nil, bottom: 12, withAnchor: .left, relativeToView: addButton)
        
        removeButton = UIButton(frame: CGRect(x:  330, y: 80 , width: 30 , height: 30))
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
        print("ADD \(libro?.nombre)")
        counterLabel.text = "\(count)"
        delegate?.addtoCar(product: libro!, count: count)
        }
    }
    
    @objc func removeProduct(){
        if count != 0 {
            count -= 1
            print("Remove")
        counterLabel.text = "\(count)"
            delegate?.removetoCar(product: libro!, count: count)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
