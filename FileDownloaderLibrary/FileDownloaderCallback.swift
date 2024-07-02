//
//  FileDownloaderCallback.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 11/06/24.
//

import Foundation

protocol FileDownloadCallback {
    func onComplete(request: FileDownloadRequest)
    func onFail(request: FileDownloadRequest, error: String)
    func onCancel(request: FileDownloadRequest)
}

