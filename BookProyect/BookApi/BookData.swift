//
//  BookData.swift
//  BookProyect
//
//  Created by GiselaCamacho on 01/02/22.
//

import Foundation

// MARK: - BookData
struct BookData: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let type, id: String
    let attributes: Attributes
}

// MARK: - Attributes
struct Attributes: Codable {
    let title, slug, content: String

    enum CodingKeys: String, CodingKey {
        case title, slug, content
    }
}


//https://app.quicktype.io/
