//
// CollectionViewCellTemplate.swift  -  Werdd
// Created by: Daniel Cruz Castro on 11/25/22
// 


import UIKit

class CollectionViewCellTemplate: UICollectionViewCell {
/// Why?
    static let identifier = "Cell"
    
    private let cellView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CardColor")
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PTSerif-Bold", size: 17)
        label.textAlignment = .left
        label.numberOfLines = 1
        label.lineBreakMode = .byTruncatingTail
        //label.backgroundColor = .cyan
        return label
    }()
    
    private let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PTSerif-Regular", size: 10)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        //label.backgroundColor = .brown
        return label
    }()
        
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeUI()
        
    }
    
    
    
    private func arrangeUI() {
        //contentView.backgroundColor = .systemCyan
        contentView.addSubview(cellView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -5),
            titleLabel.heightAnchor.constraint(equalTo: cellView.heightAnchor, multiplier: 0.2),
            
            definitionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            definitionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            //definitionLabel.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
            definitionLabel.bottomAnchor.constraint(lessThanOrEqualTo: cellView.bottomAnchor, constant: -10),
            definitionLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
        ])
    }
    
    func update(title: String, definition: String) {
        titleLabel.text = title
        //typeLabel.text = type
        definitionLabel.text = definition
    }
}
