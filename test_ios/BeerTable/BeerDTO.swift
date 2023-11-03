//
//  BeerModel.swift
//  test_ios
//
//  Created by Danila on 03.11.2023.
//

import Foundation

struct BeerDTO: Decodable {
    let id: Int
    let name: String
    let tagline: String
    let imageUrl: URL
}
