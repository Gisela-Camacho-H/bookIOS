//
//  BooksObjectCollection.swift
//  BookProyect
//
//  Created by GiselaCamacho on 25/01/22.
//

import Foundation
import UIKit

// collectionView class
class BooksObjectCollection{
    var catego : [Catego]?
    var title : String?
    
    // init the elements
    init(catego : [Catego], title : String){
        self.catego = catego
        self.title = title
    }
        
}

// each category has a name and a book
class Catego{
    var name : String?
    var books : [Book]?
    
    init(name : String, books: [Book]){
        self.name = name
        self.books = books
    }
}

// varibles per book
class Book{
    var imagen : String?
    
    init(imagen : String){
        self.imagen = imagen

    }
    
}
