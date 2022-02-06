//
//  BookData.swift
//  BookProyect
//
//  Created by GiselaCamacho on 01/02/22.
//

import Foundation

// MARK: - BookData
struct BookData: Decodable {
    let docs :[Docs]
}
struct Docs: Decodable{
    let title : String
    let first_publish_year : Int?
    let author_key : [String]?
    let author_name: [String]?
}
//https://app.quicktype.io/

