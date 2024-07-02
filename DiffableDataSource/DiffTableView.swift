//
//  DiffTableView.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 29/06/24.
//


import UIKit
enum Section {
    case main
}
struct Item: Hashable {
    let id = UUID()
    let title: String
}

typealias DataSource = UITableViewDiffableDataSource<Section, Item>

class DiffTableView: UIViewController, UITableViewDelegate {
    var dataSource: DataSource?
    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                    tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
                ])
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        setDataSource()
        setSnapshot()
        
    }
    
    func setDataSource(){
        dataSource = UITableViewDiffableDataSource(tableView: tableView) { tableview, indexPath, item in
            let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = item.title
            return cell
        }
    }
    
    func setSnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Item>()
        snapshot.appendSections([.main])
        snapshot.appendItems([Item(title: "Title1"), Item(title: "Title2"), Item(title: "Title3")])
        dataSource?.apply(snapshot, animatingDifferences: false)
        
    }
}
