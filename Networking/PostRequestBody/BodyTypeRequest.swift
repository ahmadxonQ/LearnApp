//
//  BodyTypeRequest.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 09/06/24.
//

import Foundation

public protocol BodyTypeRequest {
    func setBodyInRequest(_ request: inout URLRequest) throws
}
