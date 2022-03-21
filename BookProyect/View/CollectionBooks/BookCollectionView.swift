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
        // background per element
        self.backgroundColor = UIColor.coralColor
        
        // add elements to the view and give them size and place
        imageLibr =  UIImageView(frame: CGRect(x: 6, y: 6, width: Constants.width/6, height: Constants.height/8))
        self.addSubview(imageLibr)

    }
    
    // assign the elements 
    func setData (book : Book){
        imageLibr.image = UIImage(named: book.imagen ?? "")
    }
    
    required init?(coder: NSCoder){
        fatalError()
    }
    
}
