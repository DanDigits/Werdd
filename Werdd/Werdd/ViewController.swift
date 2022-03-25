//
//  ViewController.swift
//  Werdd
//
//  Created by Daniel-Cruz Castro on 3/17/22.
//

import UIKit

class ViewController: UIViewController {
    // Create views
    let appLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Automatically sets autolayout for view. set false when setting it yourself.
        label.text = "Werdd."
        label.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        //label.lineBreakMode = .byWordWrapping
        //label.numberOfLines = 1
        label.textAlignment = .left
        //label.backgroundColor = .blue
        return label
    }()
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Conundrum"
        label.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        label.textAlignment = .left
        label.backgroundColor = .yellow
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 1
        label.textAlignment = .left
        label.backgroundColor = .white
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Definition goes here"
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.backgroundColor = .cyan
        return label
    }()
    
    let titleStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 3
        stackView.backgroundColor = .green
        return stackView
    }()
    
    let cardStackView: UIStackView = {
       let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally // fill by each porportion
        stackView.spacing = 10
        stackView.backgroundColor = .brown
        stackView.layer.cornerRadius = 50
        return stackView
    }()

    // End view creation -----------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set view to white
        view.backgroundColor = .white
        
        // Add subviews to parent label "view"
        view.addSubview(appLabel)
        view.addSubview(cardStackView)
        cardStackView.addSubview(titleStackView)
        cardStackView.addSubview(definitionLabel)
        titleStackView.addSubview(wordLabel)
        titleStackView.addSubview(typeLabel)
        
        // Add constraints to helloLabel/submitButton view (Size/Position)
        NSLayoutConstraint.activate([
            // Constant = offset, "topAnchor" = sides, multiplier = percenetage of view (total?)
            appLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            appLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            appLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            appLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.07),
            
            cardStackView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 10),
            cardStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            cardStackView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.35),
            
            titleStackView.topAnchor.constraint(equalTo: cardStackView.topAnchor, constant: 20),
            titleStackView.leadingAnchor.constraint(equalTo: cardStackView.leadingAnchor, constant: 20),
            titleStackView.trailingAnchor.constraint(equalTo: cardStackView.trailingAnchor, constant: -20),
            titleStackView.heightAnchor.constraint(equalTo: cardStackView.heightAnchor, multiplier: 0.15),  // Disappears completely
            
            typeLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 20),
            
            definitionLabel.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: cardStackView.leadingAnchor, constant: 20),
            definitionLabel.trailingAnchor.constraint(equalTo: cardStackView.trailingAnchor, constant: -20),
            definitionLabel.bottomAnchor.constraint(equalTo: cardStackView.bottomAnchor, constant: -20),
            
        ])
    }
}

