//
//  ListCollectionViewCell.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 26/06/24.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
    let title = UILabel()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
        title.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func configure(_ model: Product) {
        title.text = model.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
