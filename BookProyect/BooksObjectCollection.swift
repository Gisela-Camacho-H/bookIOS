//
//  BooksObjectCollection.swift
//  BookProyect
//
//  Created by GiselaCamacho on 25/01/22.
//

import Foundation
import UIKit

// la tableview tendrá diferentes categorias
class BooksObjectCollection{
    var catego : [Catego]?
    var title : String?
    
    //se inicializa y se asigna los elementos que va a tener cada categoria
    init(catego : [Catego], title : String){
        self.catego = catego
        self.title = title
    }
        
}

//cada categoria tendra nombre y libro
class Catego{
    var nombre : String?
    var books : [Book]?
    
    init(nombre : String, books: [Book]){
        self.nombre = nombre
        self.books = books
    }
}

// varibles que se necesitan por cada libro
class Book{
    var imagen : String?
    
    init(imagen : String){
        self.imagen = imagen

    }
    
}
