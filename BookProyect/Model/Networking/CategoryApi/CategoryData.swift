//
//  CategoryData.swift
//  BookProyect
//
//  Created by GiselaCamacho on 04/02/22.
//

import Foundation
struct CategoryData: Decodable {
    let name : String
    let works :[Works]
}
struct Works: Decodable{
    let title : String
}
