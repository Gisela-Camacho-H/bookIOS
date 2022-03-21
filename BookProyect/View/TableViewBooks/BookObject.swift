//
//  BookObject.swift
//  BookProyect
//  Created by GiselaCamacho on 23/01/22.
//

import Foundation
import UIKit

// the tableView has different categories
class BookObject{
    var categories : [Category]?
    var title : String?
    
    // initialize and assign the elements per category
    init(categories : [Category], title : String){
        self.categories = categories
        self.title = title
    }
        
}

// each category has name and books
class Category{
    var name : String?
    var books : [Books]?
    
    // init the category
    init(name : String, books: [Books]){
        self.name = name
        self.books = books
    }
}

// variables per book
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

