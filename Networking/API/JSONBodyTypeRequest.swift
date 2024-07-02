//
//  JSONBodyTypeRequest.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 09/06/24.
//

import Foundation

struct JSONBodyTypeRequest: BodyTypeRequest {
    let body: Encodable
    
    init(body: Encodable) {
        self.body = body
    }
    
    func setBodyInRequest(_ request: inout URLRequest) throws {
        request.httpBody = try JSONEncoder().encode(body)
    }
}
