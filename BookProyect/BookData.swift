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
    let relationships: Relationships
    let links: DataLinks
}

// MARK: - Attributes
struct Attributes: Codable {
    let title, slug, content: String
    let createdAt, updatedAt: Date

    enum CodingKeys: String, CodingKey {
        case title, slug, content
        case createdAt
        case updatedAt
    }
}

// MARK: - DataLinks
struct DataLinks: Codable {
    let linksSelf: String

    enum CodingKeys: String, CodingKey {
        case linksSelf
    }
}

// MARK: - Relationships
struct Relationships: Codable {
    let authors, categories: Authors
}

// MARK: - Authors
struct Authors: Codable {
    let links: AuthorsLinks
}

// MARK: - AuthorsLinks
struct AuthorsLinks: Codable {
    let linksSelf, related: String

    enum CodingKeys: String, CodingKey {
        case linksSelf
        case related
    }
}


//https://app.quicktype.io/
