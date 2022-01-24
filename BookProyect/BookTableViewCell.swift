//
//  BookTableViewCell.swift
//  BookProyect
//
//  Created by GiselaCamacho on 23/01/22.
//

import Foundation
import UIKit

class BookTableViewCell: UITableViewCell{
    
    var ownContent: UIView?
    var nameBook: UILabel?
    var autorLibro: UILabel?
    var categoriaLibro : UILabel?
    
    var goButton: UIButton?
    var imageLibro : UIImageView?
    var shareImage: UIImageView?
    var heartImage: UIImageView?
    
    var libro: Libro?
    var height = UIScreen.main.bounds.height
    var width = UIScreen.main.bounds.width
    
    var blueColor = UIColor(displayP3Red: 21/255, green: 39/255, blue: 112/255, alpha: 1)
    var lightBlueColor = UIColor(displayP3Red: 121/255, green: 168/255, blue: 243/255, alpha: 1)
    
    init(libro : Libro){
        super.init(style: .default, reuseIdentifier: nil)
        self.libro = libro
        self.backgroundColor = .clear
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 40, height: height/7 - 15 ))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 15
        self.addSubview(ownContent!)
        
        
        nameBook = UILabel(frame: CGRect(x: 100, y: 20, width: width/2, height: 20))
        nameBook?.text = libro?.nombre
        nameBook?.font = .boldSystemFont(ofSize: 15)
        nameBook?.textAlignment = .left
        ownContent?.addSubview(nameBook!)
        
        autorLibro = UILabel(frame: CGRect(x: 100, y: 55, width: width/2, height: 20))
        autorLibro?.text = libro?.autor
        autorLibro?.font = .boldSystemFont(ofSize: 12)
        autorLibro?.textAlignment = .left
        autorLibro?.adjustsFontSizeToFitWidth = true
        ownContent?.addSubview(autorLibro!)
        
        categoriaLibro = UILabel(frame: CGRect(x: 100, y: 80, width: width/2, height: 20))
        categoriaLibro?.text = libro?.categoria
        categoriaLibro?.font = .systemFont(ofSize: 12)
        ownContent?.addSubview(categoriaLibro!)
        
        
        imageLibro = UIImageView(frame: CGRect(x: 20, y: 5 , width: 60, height: 95)) //declaramos imagen
        imageLibro?.image = UIImage(named: libro?.imagen ?? "") //asigna imagen
        imageLibro?.layer.cornerRadius = 10
        imageLibro?.layer.masksToBounds = true
        ownContent?.addSubview(imageLibro!)
        
        goButton = UIButton(frame: CGRect(x: 295, y: 30 , width: 40 , height: 30))
        goButton?.setImage(UIImage(named: "go"), for: .normal);
        ownContent?.addSubview(goButton!)
        
        shareImage = UIImageView(frame: CGRect(x: 290, y: 70 , width: 17, height: 17))
        shareImage?.image = UIImage(named: "share")
        ownContent?.addSubview(shareImage!)
        
        heartImage = UIImageView(frame: CGRect(x: 320, y: 70 , width: 17, height: 17))
        heartImage?.image = UIImage(named: "heart")
        ownContent?.addSubview(heartImage!)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
