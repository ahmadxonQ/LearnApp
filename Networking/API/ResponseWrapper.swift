//
//  ResponseWrapper.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 09/06/24.
//

import Foundation

struct ResponseWrapper<T:Decodable>: Decodable {
    let message: String
    let success: Bool
    let data: T
}

struct OptionalResponseWrapper<T: Decodable>: Decodable {
    let message: String?
    let success: Bool?
    let data: T?
}
