//
//  AuthorData.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/02/22.
//

import Foundation
/*
struct AuthorData: Decodable {
    let docs : [Doc]
}
struct Doc: Decodable {
    let name : String
    let birth_date : String
}*/
struct AuthorData: Decodable {
    let docs: [Doc]
}

// MARK: - Doc
struct Doc: Decodable {
    let key, type, name: String
}
