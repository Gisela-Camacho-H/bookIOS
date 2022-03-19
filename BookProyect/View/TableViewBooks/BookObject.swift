//
//  BookObject.swift
//  BookProyect
//  Created by GiselaCamacho on 23/01/22.
//

import Foundation
import UIKit

// la tableview tendrá diferentes categorias
class BookObject{
    var categories : [Category]?
    var title : String?
    
    //se inicializa y se asigna los elementos que va a tener cada categoria
    init(categories : [Category], title : String){
        self.categories = categories
        self.title = title
    }
        
}

//cada categoria tendra nombre y libro
class Category{
    var name : String?
    var books : [Books]?
    
    init(name : String, books: [Books]){
        self.name = name
        self.books = books
    }
}

// varibles que se necesitan por cada libro
class Books{
    var name : String?
    var description : String?
    var author : String?
    var image : String?
    var details : String?
    var aboutAuthor : String?
    var categories: String?
    var imageAuthor : String?
    
    
    init(name : String, description : String, author: String, image : String, details : String, aboutAuthor : String, categories: String, imageAuthor: String){
        self.name = name
        self.description = description
        self.author = author
        self.image = image
        self.details = details
        self.aboutAuthor = aboutAuthor
        self.categories = categories
        self.imageAuthor = imageAuthor
    }
    
}

