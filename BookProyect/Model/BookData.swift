//
//  BookData.swift
//  BookProyect
//
//  Created by GiselaCamacho on 01/02/22.
//

import Foundation
struct BookData: Decodable {
    
    let data: [Data]
    
}

struct Data: Decodable {
    let id: Int
}
