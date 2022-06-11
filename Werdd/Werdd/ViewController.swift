//
//  ViewController.swift
//  Werdd
//  Main View Controller
//  Created by Daniel Cruz-Castro on 3/17/22.
//
//  To Do:
//  - Clean up code through subclassing and extensions
//  - Fix ScrollView Function
//  - Figure Custom Colors

import UIKit


class ViewController: UIViewController {
    var buttonCounter: Int = 0
    var oneHundredEnglishWordsVolumeOne = Dictionary()
    
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
        button.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
// viewDidLoad() -----------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set app background color
        view.backgroundColor = UIColor(named: "WerddColor")
        
        // UITableViewDataSource and UITableViewDelegate delegates work to ViewController for tableView by declaring this
        tableView.dataSource = self
        tableView.delegate = self
        
        // Set up UI
        arrangeUI()
    }

// Functions -------------------------------------------------------------------------------------------------------------------
    // Update views with new information
    func updateViews(withDictionary dictionary: Word) {
/// ASK!!!!!! Why ? in instruction video and what "withDictionary"
        wordLabel.text = dictionary.title
        typeLabel.text = dictionary.type
        definitionLabel.text = dictionary.definition
    }
    
    // Randomize which word is pulled from the dictionary (and shown)
    func randomizeWord() -> Word? {
/// ASKK!!!!!! how to provide an operator in case dictionary fail with ??
        return oneHundredEnglishWordsVolumeOne.dictionary.randomElement()
    }
    
    // Specify button action
    @objc func refreshButtonPressed() {
        buttonCounter += 1
        let randomWord = randomizeWord()
        updateViews(withDictionary: randomWord!)
        print("Button Pressed: \(buttonCounter)")
    }
    
    // Add subviews and manage layout constraints
    func arrangeUI() {
        view.addSubview(appLabel)
        view.addSubview(scrollView)
        view.addSubview(refreshButton)
        view.addSubview(tableView)
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
            scrollView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 25),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            scrollView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            // Refresh button
            refreshButton.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -60), //-445 for top placement
            refreshButton.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -65),
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
            
            typeLabel.topAnchor.constraint(equalTo: wordLabel.topAnchor, constant: 17), // Would it be better to specify bottom text alignment and have typeLabel instead bottom anchor to worldlabel bottom anchor? Then location next to word label should be based on vertical size and not respective constraints
            typeLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor),
            
            // Definition body label --- RESOLVE SCROLL VIEW ISSUES
            definitionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            //definitionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 23),
            definitionLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, constant: -46),
            definitionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor),
            
            // Table view
            tableView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}





// Extension for Table View Data Source --------------------------------------------------------------------------------------------
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oneHundredEnglishWordsVolumeOne.dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration() // Method returns styling and text for cell
        
        // Establish tableView cell content
        content.text = oneHundredEnglishWordsVolumeOne.dictionary[indexPath.row].title
        content.secondaryText = oneHundredEnglishWordsVolumeOne.dictionary[indexPath.row].definition
        
        cell.contentConfiguration = content
        return cell
    }
}

// Extension for Table View Delegation --------------------------------------------------------------------------------------------
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(oneHundredEnglishWordsVolumeOne.dictionary[indexPath.row].title)")
    }
}

/* Extension for custom colors ---------------------------------------------------------------------------------------------------
extension UIColor {
    static let backgroundColor = UIColor(named: "WerddColor")
    static let werddColor = UIColor(named: "CardColor")
}
*/
