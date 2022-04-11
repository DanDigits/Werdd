//
//  ViewController.swift
//  Werdd
//
//  Created by Daniel-Cruz Castro on 3/17/22.
//

import UIKit

// Word struct
struct Word {
    let title: String
    let type: String
    let definition: String
//    let antonym: String
//    let synonym: String
//    let example: String
}

class ViewController: UIViewController {
    let appLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false // Automatically sets autolayout for view; set false when setting it yourself. Always set.
        label.text = "Werdd."
        label.font = UIFont.systemFont(ofSize: 47, weight: .bold)
        label.textAlignment = .left
        //label.backgroundColor = .green
        return label
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.layer.cornerRadius = 50
        scrollView.backgroundColor = UIColor(named: "CardColor")
        return scrollView
    }()
    
    let cardView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        //view.backgroundColor = .blue
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
        label.text = "Creating a sequence of instructions to enable a computer to do something."
        label.font = UIFont(name: "PTSerif-Regular", size: 15)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        //label.backgroundColor = .cyan
        return label
    }()
    
    let refreshButton: ButtonTemplate = {
        let button = ButtonTemplate()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
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
    // Function specifically to add subviews and manage layout constrains in app, meant more so to be clean
    func arrangeUI() {
        view.addSubview(appLabel)
        view.addSubview(scrollView)
        view.addSubview(refreshButton)
        scrollView.addSubview(cardView)
        cardView.addSubview(wordLabel)
        cardView.addSubview(typeLabel)
        cardView.addSubview(definitionLabel)
        
        NSLayoutConstraint.activate([
            // App title label
            appLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            appLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            appLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            
            // Scroll view
            scrollView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 35),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            // Refresh button
            refreshButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -70),
            refreshButton.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -70),
            refreshButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -25),
            refreshButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -25),
            
            // Card view
            cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            cardView.bottomAnchor.constraint(equalTo: definitionLabel.bottomAnchor, constant: 25),
            
            // Respective word and type of speech labels
            wordLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            wordLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            
            typeLabel.topAnchor.constraint(equalTo: wordLabel.topAnchor, constant: 17),
                // Would it be better to specify bottom text alignment and have typeLabel instead bottom anchor to worldlabel bottom anchor? Then location next to word label should be based on size and not respective constraints
            typeLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor),
            
            // Definition body label --- RESOLVE SCROLL VIEW ISSUES
            definitionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            //definitionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 23),
            definitionLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, constant: -46),
            definitionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
        ])
    }
    
// Dictionaries ---------------------------------------------------------------------------------------------------
    let dictionary: [Word] = [
        Word(title: "Bus", type: "noun", definition: "Carries children"),
        Word(title: "Bus", type: "noun", definition: "Carries children"),
        Word(title: "Bus", type: "noun", definition: "Carries children"),
        Word(title: "Bus", type: "noun", definition: "Carries children"),
        Word(title: "Bus", type: "noun", definition: "Carries children"),
    ]
}

