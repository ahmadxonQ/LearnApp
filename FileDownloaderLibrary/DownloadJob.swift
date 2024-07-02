//
//  DownloadJob.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 11/06/24.
//

import Foundation

enum DownloadState {
    case pending
    case active
    case paused
    case completed
    case failed
}

class DownloadJob {
    let request: FileDownloadRequest
    let task: FileDownloadTask
    var state: DownloadState
    
    init(request: FileDownloadRequest, task: FileDownloadTask, state: DownloadState = .pending) {
        self.request = request
        self.task = task
        self.state = state
    }
}

