//
//  FileDownloaderConfig.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 11/06/24.
//

import Foundation

class FileDownloaderConfig {
    let maxParallelDownloads: Int

    init(maxParallelDownloads: Int = 4) {
        self.maxParallelDownloads = maxParallelDownloads
    }
}
