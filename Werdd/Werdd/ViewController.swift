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
        label.translatesAutoresizingMaskIntoConstraints = false // Automatically sets autolayout for view. set false when setting it yourself. Always set.
        label.text = "Werdd."
        label.font = UIFont.systemFont(ofSize: 47, weight: .bold)
        label.textAlignment = .left
        //label.backgroundColor = .green
        return label
    }()
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "CardColor")
        view.layer.cornerRadius = 50
        return view
    }()
    
    let wordLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Programming"
        label.font = UIFont(name: "PTSerif-Regular", size: 30)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        //label.backgroundColor = .yellow
        return label
    }()
    
    let typeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "noun"
        label.font = UIFont(name: "PTSerif-Italic", size: 15)
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        //label.backgroundColor = .white
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Creating a sequence of instructions to enable a computer to do something"
        label.font = UIFont(name: "PTSerif-Regular", size: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        //label.backgroundColor = .cyan
        return label
    }()

    // viewDidLoad() ------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set app background color
        view.backgroundColor = UIColor(named: "WerddColor")
        
        // Set up UI
        arrangeUI()
        
    }
    
    // Functions ---------------------------------------------------------------------------------------------------
    func arrangeUI() {
        // Function specifically to add subviews and manage layout constrains in app, meant more so to be clean
        
        view.addSubview(appLabel)
        view.addSubview(cardView)
        cardView.addSubview(wordLabel)
        cardView.addSubview(typeLabel)
        cardView.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            // App title label
            appLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            appLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            appLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            // Card background view
            cardView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 35),
            cardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            cardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            cardView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            // Respective word label, and type of speech label
            wordLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            wordLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            
            typeLabel.topAnchor.constraint(equalTo: wordLabel.topAnchor, constant: 17), // Would it be better to specify bottom text alignment and have typeLabel instead bottom anchor to worldlabel bottom anchor? Then location next to word label should be based on size and not respective constraints
            typeLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor),
            
            // Definition body label
            definitionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            definitionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -15),
            //definitionLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor, constant: -10),
        ])
    }
}

