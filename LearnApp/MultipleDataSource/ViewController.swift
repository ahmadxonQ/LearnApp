//
//  ViewController.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 28/05/24.
//

import UIKit

class ViewController2: UIViewController, UITableViewDelegate {
    private lazy var adsDataSource = AdsDataSource()
    private lazy var adsDataSource2 = AdsDataSource()
    private lazy var dataSource = TableViewDataSourceComposed(dataSources: [
        adsDataSource,
        ContentDataSource(),
        adsDataSource,
        adsDataSource2,
        ContentDataSource()
    ])

    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Hello title"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "personalhotspot.circle"), primaryAction: UIAction { [adsDataSource, weak self] _ in
            adsDataSource.toggle(self!.tableView)
            
        })
        tableView.dataSource = dataSource
        view.addSubview(tableView)
        tableView.frame = CGRect(x: 0, y: 100, width: view.frame.width, height: view.frame.height)
        tableView.delegate = self
        tableView.backgroundColor = .systemBackground
    }


}




