//
//  BookCollectionView.swift
//  BookProyect
//
//  Created by GiselaCamacho on 24/01/22.
//

import Foundation
import UIKit

class BookCollectionView : UICollectionViewCell{
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var imageLibr : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor(displayP3Red: 255/255, green: 242/255, blue: 223/255, alpha: 1)
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "divina")
        return image
    }()

    override init(frame: CGRect){
        super.init(frame: .zero)
        
        let color =  UIColor(displayP3Red: 283/255, green: 162/255, blue: 129/255, alpha: 1)
        self.backgroundColor = color
        
        imageLibr =  UIImageView(frame: CGRect(x: 10, y: 10 , width: 85, height: 140))
        self.addSubview(imageLibr)
        //imageLibr.addAnchors(left: 10, top: 15, right: 10, bottom: 15)

    }
    
    func setData (libro: Libro){
        print(libro.nombre ?? "")
        imageLibr.image = UIImage(named: libro.imagen ?? "")
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
}
