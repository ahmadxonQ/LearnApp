//
//  Controller1.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 29/05/24.
//

import UIKit    
class ContentDataSource: NSObject, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell") ?? UITableViewCell(style: .default, reuseIdentifier: "contentCell")
        cell.textLabel?.text = "This is an content \(indexPath.row)"
        cell.contentView.backgroundColor = .green
        return  cell
    }
}
