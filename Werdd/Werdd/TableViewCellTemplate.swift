//
// TableViewCellTemplate.swift  -  Werdd
// Created by: Daniel Cruz Castro on 6/16/22
// Stylizes the cell for the tableview


import Foundation
import UIKit

class TableViewCellTemplate: UITableViewCell {
    private let cellBubble: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CardColor")
        view.layer.cornerRadius = 15
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PTSerif-Bold", size: 20)
        label.textAlignment = .left
        //label.backgroundColor = .cyan
        return label
    }()
    
    private let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PTSerif-Italic", size: 15)
        label.textAlignment = .left
        //label.backgroundColor = .green
        return label
    }()
    
    private let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "PTSerif-Regular", size: 15)
        label.textAlignment = .left
        //label.backgroundColor = .gray
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
// Override initializer ---------------------------------------------------------------------------------------
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        arrangeUI()
        contentView.backgroundColor = .systemPink
//        contentView.topAnchor.constraint(equalTo: safetopAnchor, constant: 10)
    }
    
// Functions -----------------------------------------------------------------------------------------------------
    func update(title: String, type: String, definition: String) {
        titleLabel.text = title
        typeLabel.text = type
        definitionLabel.text = definition
    }
    
    private func arrangeUI() {
        cellBubble.addSubview(titleLabel)
        cellBubble.addSubview(typeLabel)
        cellBubble.addSubview(definitionLabel)
        contentView.addSubview(cellBubble)
        
        NSLayoutConstraint.activate([
            cellBubble.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            cellBubble.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellBubble.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cellBubble.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            
            titleLabel.topAnchor.constraint(equalTo: cellBubble.topAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: cellBubble.leadingAnchor, constant: 15),
            
//            typeLabel.topAnchor.constraint(lessThanOrEqualTo: titleLabel.topAnchor),
            typeLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 5),
            typeLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -2),
//            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: cellBubble.trailingAnchor),
            
            definitionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            definitionLabel.bottomAnchor.constraint(equalTo: cellBubble.bottomAnchor, constant: -10),
            definitionLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: cellBubble.trailingAnchor, constant: -5),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
