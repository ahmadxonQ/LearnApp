//
//  CompCollection.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 29/06/24.
//

import UIKit

class CompCollection: UIViewController, UICollectionViewDelegate {
    var dataSource: UICollectionViewDiffableDataSource<Int, Int>! = nil
    var collectionView: UICollectionView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Scrollable rows"
        //configureHierarchy()
        configureDataSource()
        
    }
    
    func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            let item = NSCollectionLayoutItem(
                       layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                             heightDimension: .fractionalHeight(1.0)))
            item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 10)
            
            let containerGroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.85),
                                                             heightDimension: .fractionalHeight(0.4)),
            subitems: [item])
            let section = NSCollectionLayoutSection(group: containerGroup)
                   section.orthogonalScrollingBehavior = .continuous
            return section
        }
        return layout
    }
    
    func configureDataSource(){
        let emojies = ["🟡", "🟡", "🟡", "🟡", "🟡", "🟡","🟡", "🟡", "🟡"]
        let cellRegistration = UICollectionView.CellRegistration<TextCell, Int>{ (cell, indexPath, identifier) in
            cell.label.text = "\(emojies[indexPath.item])"
            cell.contentView.backgroundColor = .systemCyan
            cell.contentView.layer.borderColor = UIColor.black.cgColor
            cell.contentView.layer.borderWidth = 1
            cell.contentView.layer.cornerRadius = 8
            cell.label.textAlignment = .center
            cell.label.font = UIFont.systemFont(ofSize: 150)
            
            self.dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: self.collectionView) {
                (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in
                return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: identifier)
            }
            var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
            var identifierOffset = 0
            let itemsPerSection = 9
            for section in 0..<5 {
                snapshot.appendSections([section])
                let maxIdentifier = identifierOffset + itemsPerSection
                snapshot.appendItems(Array(identifierOffset..<maxIdentifier))
                identifierOffset += itemsPerSection
            }
            self.dataSource.apply(snapshot, animatingDifferences: false)
            
        }
    }
    
//    func configureHierarchy() {
//           collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
//           collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
//           collectionView.backgroundColor = .systemMint
//           view.addSubview(collectionView)
//           collectionView.delegate = self
//    }
}
