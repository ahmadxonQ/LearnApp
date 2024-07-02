//
//  DataSourceComposite.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 29/05/24.
//

import UIKit
class TableViewDataSourceComposed: NSObject ,UITableViewDataSource {
    
    let dataSources: [UITableViewDataSource]
    
    init(dataSources: [UITableViewDataSource]) {
        self.dataSources = dataSources
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        dataSources.reduce(0) { partialResult, dataSource in
            print("partial result",partialResult)
            return partialResult + (dataSource.numberOfSections?(in: tableView) ?? 1)
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataSource(forSection: section, in: tableView).tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dataSource(forSection: indexPath.section, in: tableView).tableView(tableView, cellForRowAt: indexPath)
    }
    
    private func dataSource(forSection section: Int, in tableView: UITableView) -> UITableViewDataSource {
        var sectionCount = 0
        for dataSource in dataSources {
            sectionCount += dataSource.numberOfSections?(in: tableView) ?? 1
            if section < sectionCount {
                return dataSource
            }
        }
        fatalError("No any dataSource found for section \(section)")
    }
}
