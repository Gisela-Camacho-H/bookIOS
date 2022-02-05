//
//  AuthorData.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/02/22.
//

import Foundation

struct AuthorData: Decodable {
    let docs: [Doc]
}

struct Doc: Decodable {
    let name, top_work: String
}

