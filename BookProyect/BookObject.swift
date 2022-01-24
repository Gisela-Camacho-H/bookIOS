//
//  BookObject.swift
//  BookProyect
//
//  Created by GiselaCamacho on 23/01/22.
//

import Foundation
import UIKit

// la tableview tendrá diferentes categorias
class BookObject{
    var categorias : [Categoria]?
    var title : String?
    
    //se inicializa y se asigna los elementos que va a tener cada categoria
    init(categorias : [Categoria], title : String){
        self.categorias = categorias
        self.title = title
    }
        
}

//cada categoria tendra nombre y libro
class Categoria{
    var nombre : String?
    var libros : [Libro]?
    
    init(nombre : String, libros: [Libro]){
        self.nombre = nombre
        self.libros = libros
    }
}

// varibles que se necesitan por cada libro
class Libro{
    var nombre : String?
    var descripcion : String?
    var autor : String?
    var imagen : String?
    var detalles : String?
    var sobreAutor : String?
    var categoria: String?
    
    
    init(nombre : String, descripcion : String, autor: String, imagen : String, detalles : String, sobreAutor : String, categoria: String){
        self.nombre = nombre
        self.descripcion = descripcion
        self.autor = autor
        self.imagen = imagen
        self.detalles = detalles
        self.sobreAutor = sobreAutor
        self.categoria = categoria
    }
    
}

