//
//  Product.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 26/06/24.
//

import Foundation

//enum Section: Int, CaseIterable {
//    case featured
//    case onSale
//    case all
//}


struct Product: Hashable {
    let title: String
    let id: UUID
    
    
    init(title: String, id: UUID) {
        self.title = title
        self.id = id
    }
}

struct ProductList {
    let featured: [Product]
    let onSale: [Product]
    let all: [Product]
}

