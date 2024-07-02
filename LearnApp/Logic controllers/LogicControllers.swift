//
//  LogicControllers.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 09/06/24.
//

import Foundation

protocol Loadable {
    associatedtype Model
    func load(from url: URL) async throws -> Model
}




//class UserLoader: Loadable {
//    func load(from url: URL) async throws -> User {
//        <#code#>
//    }
//    
//}


struct User {
    let name: String
    let username: String
    let image : String
}
