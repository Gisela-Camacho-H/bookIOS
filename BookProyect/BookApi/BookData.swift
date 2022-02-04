//
//  BookData.swift
//  BookProyect
//
//  Created by GiselaCamacho on 01/02/22.
//

import Foundation

// MARK: - BookData
struct BookData: Codable {
    let key, name, subjectType: String
    let workCount: Int
    let works: [Work]
    let ebookCount: Int

    enum CodingKeys: String, CodingKey {
        case key, name
        case subjectType
        case workCount
        case works
        case ebookCount
    }
}

// MARK: - Work
struct Work: Codable {
    let key, title: String
    let editionCount, coverID: Int
    let coverEditionKey: String
    let subject, iaCollection: [String]
    let lendinglibrary, printdisabled: Bool
    let lendingEdition, lendingIdentifier: String
    let authors: [Author]
    let firstPublishYear: JSONNull?
    let ia: String
    let publicScan, hasFulltext: Bool
    let availability: Availability

    enum CodingKeys: String, CodingKey {
        case key, title
        case editionCount
        case coverID
        case coverEditionKey
        case subject
        case iaCollection
        case lendinglibrary, printdisabled
        case lendingEdition
        case lendingIdentifier
        case authors
        case firstPublishYear
        case ia
        case publicScan
        case hasFulltext
        case availability
    }
}

// MARK: - Author
struct Author: Codable {
    let key: Key
    let name: Name
}

enum Key: String, Codable {
    case authorsOL2162284A = "/authors/OL2162284A"
    case authorsOL219525A = "/authors/OL219525A"
    case authorsOL31727A = "/authors/OL31727A"
}

enum Name: String, Codable {
    case bramStoker = "Bram Stoker"
    case robertLouisStevenson = "Robert Louis Stevenson"
    case stephenKing = "Stephen King"
}

// MARK: - Availability
struct Availability: Codable {
    let status: String
    let availableToBrowse, availableToBorrow, availableToWaitlist: Bool?
    let isPrintdisabled, isReadable, isLendable: Bool
    let identifier: String
    let isbn: String?
    let oclc: JSONNull?
    let openlibraryWork, openlibraryEdition: String?
    let lastLoanDate: Date?
    let numWaitlist: String?
    let lastWaitlistDate: Date?
    let collection: String?
    let isRestricted, isBrowseable: Bool
    let src: Src
    let errorMessage: String?

    enum CodingKeys: String, CodingKey {
        case status
        case availableToBrowse
        case availableToBorrow
        case availableToWaitlist
        case isPrintdisabled
        case isReadable
        case isLendable
        case identifier, isbn, oclc
        case openlibraryWork
        case openlibraryEdition
        case lastLoanDate
        case numWaitlist
        case lastWaitlistDate
        case collection
        case isRestricted
        case isBrowseable
        case src
        case errorMessage
    }
}

enum Src: String, Codable {
    case coreModelsLendingGetAvailability = "core.models.lending.get_availability"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}


//https://app.quicktype.io/
