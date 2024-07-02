//
//  CustomRegularView.swift
//  LearnApp
//
//  Created by Ahmadxon Qodirov on 02/07/24.
//

import UIKit
import Colors
class CustomRegularCell: UICollectionViewCell {
    static let reuseIdentifier = "custom-regular-cell"
    
    let emojiLabel = UILabel()
    let titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(emojiLabel)
        contentView.addSubview(titleLabel)
        contentView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        NSLayoutConstraint.activate([
            emojiLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emojiLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            
            titleLabel.topAnchor.constraint(equalTo: emojiLabel.bottomAnchor, constant: 8),
            titleLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 8),
            //titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
        
    }
    
    override func updateConfiguration(using state: UICellConfigurationState) {
        super.updateConfiguration(using: state)
    

        var backgroundConfig = UIBackgroundConfiguration.listPlainCell()
        //backgroundConfig.backgroundColor = .green0 // Your desired background color
        backgroundConfig.cornerRadius = 12
        backgroundConfig.strokeWidth = 1
        backgroundConfig.strokeColor = .gray
        backgroundConfiguration = backgroundConfig
    }
    
    func configure(with emoji: Emoji) {
        emojiLabel.text = emoji.text
        titleLabel.text = emoji.title
    }
}

