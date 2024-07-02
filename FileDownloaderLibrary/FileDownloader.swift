//
//  FileDownloader.swift
//  LearnApp

// interview questions and answers here:
// https://github.com/weeeBox/mobile-system-design/blob/master/exercises/file-downloader-library.md


import Foundation

class FileDownloader {
    private let maxParallelDownloads: Int
    private var activeDownloads: [URL: FileDownloadTask] = [:]
    
    init(config: FileDownloaderConfig) {
        self.maxParallelDownloads = config.maxParallelDownloads
    }
    
    func download(request: FileDownloadRequest) -> FileDownloadTask {
        let task = FileDownloadTask(request: request)
        activeDownloads[request.sourceUrl] = task
        
        // Start the download task (async operation)
        startDownloadTask(task)
        
        return task
    }
    
    func pauseAll() {
        for task in activeDownloads.values {
            task.pause()
        }
    }
    
    func resumeAll() {
        for task in activeDownloads.values {
            task.resume()
        }
    }
    
    func cancelAll() {
        for task in activeDownloads.values {
            task.cancel()
        }
    }
    
    func activeTasks() -> [FileDownloadTask] {
        return Array(activeDownloads.values)
    }
    
    private func startDownloadTask(_ task: FileDownloadTask) {
        // Implementation to start the download
        // Handle async download process
    }
}


