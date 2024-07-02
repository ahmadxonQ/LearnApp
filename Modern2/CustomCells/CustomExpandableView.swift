//
//  CustomExpandableView.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 02/07/24.
//

import UIKit
import Colors
class CustomHeaderCell: UICollectionViewListCell {
    static let reuseIdentifier = "custom-header-cell"
    
    let titleLabel = UILabel()
    let titleLabel2 = UILabel()
    let disclosureImageView = UIImageView(image: UIImage(systemName: "chevron.right"))
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel2.translatesAutoresizingMaskIntoConstraints = false
        disclosureImageView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(titleLabel2)
        //contentView.addSubview(disclosureImageView)
        //contentView.backgroundColor = .green0
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel2.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            titleLabel2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            //contentView.heightAnchor.constraint(equalToConstant: 100),
            
//            disclosureImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
//            disclosureImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        //backgroundColor = .gray
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
    

        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
        //backgroundConfig.backgroundColor = .green0 // Your desired background color
        backgroundConfig.cornerRadius = 12
//        backgroundConfig.strokeWidth = 5
//        backgroundConfig.strokeColor = .gray
        backgroundConfiguration = backgroundConfig
    }

    
    func configure(with title: String) {
        titleLabel.text = title
        titleLabel2.text = title.uppercased()
    }
    
    func setDisclosureIndicator(isExpanded: Bool) {
        let imageName = isExpanded ? "chevron.down" : "chevron.right"
        disclosureImageView.image = UIImage(systemName: imageName)
    }
}

