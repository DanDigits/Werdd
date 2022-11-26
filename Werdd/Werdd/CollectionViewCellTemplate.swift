//
// CollectionViewCellTemplate.swift  -  Werdd
// Created by: Daniel Cruz Castro on 11/25/22
// 


import UIKit

class CollectionViewCellTemplate: UICollectionViewCell {
    static let identifier = "Cell"
    
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
}
