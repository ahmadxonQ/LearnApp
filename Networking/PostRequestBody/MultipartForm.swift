//
//  MultipartForm.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 09/06/24.
//

import Foundation

public class MultipartForm: BodyTypeRequest {
    private lazy var boundary = generateBoundary()
    
    private let data: Data
    private let mimeType: String
    private let name: String
    private let fileName: String
    
    init(data: Data, mimeType: String, name: String, fileName: String) {
        self.data = data
        self.mimeType = mimeType
        self.name = name
        self.fileName = fileName
    }
    
    public func setBodyInRequest(_ request: inout URLRequest) throws {
        let body = makeBody()
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        body.append("--\(boundary)--")
        request.httpBody = body as Data
    }
    
    private func makeBody() -> NSMutableData {
        let body = NSMutableData()
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"\(name)\"; filename=\"\(fileName)\"\r\n")
        body.append("Content-Type: \(mimeType)\r\n")
        body.append("\r\n")
        body.append(data)
        body.append("\r\n")
        return body
    }
}

extension MultipartForm {
    private func generateBoundary() -> String {
        let range = UInt32.min...UInt32.max
        let randomValue1 = UInt32.random(in: range)
        let randomValue2 = UInt32.random(in: range)
        return String(format: "%08x%08x", randomValue1, randomValue2)
    }
}

extension NSMutableData {
    fileprivate func append(_ string: String) {
        guard let data = string.data(using: .utf8) else { return }
        append(data)
    }
}

