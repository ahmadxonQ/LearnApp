//
//  FileDownloadTask.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 11/06/24.
//

import Foundation

class FileDownloadTask: NSObject {
    private let request: FileDownloadRequest
    private var isPaused: Bool = false
    private var isCancelled: Bool = false
    private var downloadCallback: FileDownloadCallback?
    
    init(request: FileDownloadRequest) {
        self.request = request
    }
    
    func addDownloadCallback(callback: FileDownloadCallback) {
        self.downloadCallback = callback
    }
    
    func pause() {
        isPaused = true
        // Implementation to pause the download
    }
    
    func resume() {
        isPaused = false
        // Implementation to resume the download
    }
    
    func cancel() {
        isCancelled = true
        // Implementation to cancel the download
    }
    
    // Additional methods and properties as needed
}
