//
//  BookCollectionView.swift
//  BookProyect
//
//  Created by GiselaCamacho on 24/01/22.
//

import Foundation
import UIKit

class BookCollectionView : UICollectionViewCell{
    
    var imageLibr : UIImageView = {
        let image = UIImageView()
        image.backgroundColor = UIColor.backgroundColor
        image.contentMode = .scaleAspectFit
        image.image = UIImage(named: "divina")
        return image
    }()

    override init(frame: CGRect){
        super.init(frame: .zero)
        self.backgroundColor = UIColor.coralColor
        
        imageLibr =  UIImageView(frame: CGRect(x: 10, y: 10 , width: 100, height: 160))
        self.addSubview(imageLibr)

    }
    
    func setData (book : Book){
        imageLibr.image = UIImage(named: book.imagen ?? "")
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
}
