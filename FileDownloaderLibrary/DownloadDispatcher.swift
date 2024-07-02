//
//  DownloadDispatcher.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 11/06/24.
//

import Foundation

class DownloadDispatcher {
    private var downloadQueue: [DownloadJob] = []
    private var activeDownloads: [DownloadJob] = []
    private let maxParallelDownloads: Int

    init(maxParallelDownloads: Int) {
        self.maxParallelDownloads = maxParallelDownloads
    }

    func addDownloadJob(_ job: DownloadJob) {
        downloadQueue.append(job)
        startNextJobIfPossible()
    }

    func startNextJobIfPossible() {
        guard activeDownloads.count < maxParallelDownloads, !downloadQueue.isEmpty else {
            return
        }

        let nextJob = downloadQueue.removeFirst()
        activeDownloads.append(nextJob)
        //nextJob.task.start()
    }

    func jobDidComplete(_ job: DownloadJob) {
        if let index = activeDownloads.firstIndex(where: { $0 === job }) {
            activeDownloads.remove(at: index)
        }
        startNextJobIfPossible()
    }
}
