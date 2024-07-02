//
//  CustomCollection2.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 02/07/24.
//
import Foundation

struct Section2: Hashable {
    let id: UUID
    let title: String
}

struct Item2: Hashable {
    let id: UUID
    let title: String
}

import UIKit

class CustomCollection2: UIViewController {
    var collectionView: UICollectionView!
    var dataSource: UICollectionViewDiffableDataSource<Section2, Item2>!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureCollectionView()
        configureDataSource()
    }

    func configureCollectionView() {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) -> NSCollectionLayoutSection? in
            return self.createLayout()
        }
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(collectionView)
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.reuseIdentifier)
    }

    func createLayout() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .absolute(44))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(44))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        return section
    }
}


extension CustomCollection2 {
    func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource<Section2, Item2>(collectionView: collectionView) {
            (collectionView, indexPath, item) -> UICollectionViewCell? in
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
            // Configure cell with data
            return cell
        }
        
        dataSource.apply(initialSnapshot())
        
        dataSource.sectionSnapshotHandlers.willCollapseItem = { [weak self] item in
            guard let self = self else { return }
            var snapshot2 = self.dataSource.snapshot()
            if let section = snapshot2.sectionIdentifier(containingItem: item) {
                var sectionSnapshot = self.dataSource.snapshot(for: section)
                sectionSnapshot.collapse([item])
                self.dataSource.apply(sectionSnapshot, to: section)
            }
        }
        
        dataSource.sectionSnapshotHandlers.willExpandItem = { [weak self] item in
            guard let self = self else { return }
            var snapshot2 = self.dataSource.snapshot()
            if let section = snapshot2.sectionIdentifier(containingItem: item) {
                var sectionSnapshot = self.dataSource.snapshot(for: section)
                sectionSnapshot.expand([item])
                self.dataSource.apply(sectionSnapshot, to: section)
            }
        }
    }

    func initialSnapshot() -> NSDiffableDataSourceSnapshot<Section2, Item2> {
        var snapshot = NSDiffableDataSourceSnapshot<Section2, Item2>()
        let section1 = Section2(id: UUID(), title: "Section 1")
        snapshot.appendSections([section1])
        let items = [Item2(id: UUID(), title: "Item 1"),
                     Item2(id: UUID(), title: "Item 2"),
                     Item2(id: UUID(), title: "Item 3")]
        snapshot.appendItems(items, toSection: section1)
        return snapshot
    }
}





class CustomCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "custom-collection-view-cell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        contentView.backgroundColor = .systemBlue
    }
}
