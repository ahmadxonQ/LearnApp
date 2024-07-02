//
//  CollectionView.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 25/06/24.
//  https://www.swiftbysundell.com/articles/building-modern-collection-views-in-swift/

//import UIKit
//
//class ProductListViewController: UIViewController {
//    private static let cellReuseID = "product-cell"
//    private lazy var collectionView = makeCollectionView()
//    private lazy var dataSource = makeDataSource()
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        collectionView.register(ListCollectionViewCell.self, forCellWithReuseIdentifier: Self.cellReuseID)
//        collectionView.dataSource = dataSource
//        
//    }
//    
//    func productListDidLoad(_ list: ProductList) {
//        var snapshot = NSDiffableDataSourceSnapshot<Section, Product>()
//        snapshot.appendSections(Section.allCases)
//        snapshot.appendItems(list.featured, toSection: .featured)
//        snapshot.appendItems(list.onSale, toSection: .onSale)
//        snapshot.appendItems(list.all, toSection: .all)
//        
//       // dataSource.apply(<#T##snapshot: NSDiffableDataSourceSnapshot<Section, Product>##NSDiffableDataSourceSnapshot<Section, Product>#>)
//    }
//    
//}
//
//private extension ProductListViewController {
//    func makeCollectionView() -> UICollectionView {
//        let layout = UICollectionViewCompositionalLayout.list(using: UICollectionLayoutListConfiguration(appearance: .insetGrouped))
//        return UICollectionView(frame: .zero, collectionViewLayout: layout)
//    }
//}
//
//private extension ProductListViewController {
//    func makeDataSource() -> UICollectionViewDiffableDataSource<Section, Product> {
//        UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { collectionView, indexPath, product in
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Self.cellReuseID, for: indexPath) as! ListCollectionViewCell
//            cell.title.text = product.title
//            
//            return cell
//        }
//        )
//    }
//}
