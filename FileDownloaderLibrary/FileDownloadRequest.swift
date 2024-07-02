//
//  FileDownloadRequest.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 11/06/24.
//

import Foundation

class FileDownloadRequest {
    let sourceUrl: URL
    let destPath: String

    init(sourceUrl: URL, destPath: String) {
        self.sourceUrl = sourceUrl
        self.destPath = destPath
    }
}

