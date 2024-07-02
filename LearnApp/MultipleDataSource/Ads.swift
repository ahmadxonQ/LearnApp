//
//  Ads.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 29/05/24.
//

import UIKit
class AdsDataSource: NSObject, UITableViewDataSource {
    private var isShowingAds = true
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        isShowingAds ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "adsCell") ?? UITableViewCell(style: .default, reuseIdentifier: "adsCell")
        cell.textLabel?.text = "This is an ads"
        cell.contentView.backgroundColor = .yellow
        return  cell
    }
    
    func toggle(_ tableview: UITableView) {
        isShowingAds.toggle()
        tableview.reloadData()
    }
    
}
