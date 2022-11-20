//
//  ViewController.swift
//  Werdd
//  Main View Controller
//  Created by Daniel Cruz-Castro on 3/17/22.
//
//  To Do:
//  - Clean up code through subclassing and extensions
//  - Fix ScrollView
//  - Figure custom color function

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
    
    // Lazy sets up the collection view when accessed
/// Does layout/collectionView order matter?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/3.5, height: view.frame.size.width/3.5)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) // Set to zero to allow autolayout modification
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        collectionView.backgroundColor = .systemPink
        return collectionView
    }()
    
// viewDidLoad() -----------------------------------------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set app background color
        view.backgroundColor = UIColor(named: "WerddColor")
        
        // UITableViewDataSource and UITableViewDelegate delegates work to ViewController for tableView by declaring this
        //tableView.dataSource = self
        //tableView.delegate = self
        
        collectionView.dataSource = self
        
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
        view.addSubview(collectionView)
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
            refreshButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -27),
            refreshButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -25),
            
            // Card view
            cardView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor), //--------> Scrolling Limiter
            
            // Respective word and type of speech labels
            wordLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            wordLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            
            typeLabel.topAnchor.constraint(equalTo: wordLabel.topAnchor, constant: 17), /// Would it be better to specify bottom text alignment and have typeLabel instead bottom anchor to worldlabel bottom anchor? Then location next to word label should be based on vertical size and not respective constraints?
            typeLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor),
            
            // Definition body label
            definitionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            definitionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -23),
//            definitionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor), //--------------> Related to veritcal scrolling
            
            // Table view
            collectionView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 25),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // What cell to use for each column/row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.contentView.backgroundColor = .cyan
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // Number of items in cell
        return 24
    }
}

//Extension for custom colors ---------------------------------------------------------------------------------------------------
//extension UIColor {
//    static let backgroundColor = UIColor(named: "WerddColor")
//    static let werddColor = UIColor(named: "CardColor")
//}





// DEPRECATED TABLE VIEW CODE-------------------------------------------------------------------------------------------------------
/* DEPRECATED TABLE VIEW INIT
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(TableViewCellTemplate.self, forCellReuseIdentifier: "TableViewCellTemplate") // Register custom tableView cell to table view
        tableView.layer.cornerRadius = 25
        tableView.backgroundColor = .systemPink
        tableView.separatorStyle = .none
        return tableView
    }()
*/
/* DEPRECATED TABLE VIEW EXTENSIONS
// Extension for Table View Data Source --------------------------------------------------------------------------------------------
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return oneHundredEnglishWordsVolumeOne.dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Guard lets you direct what happens should any error occur (the "else" statement), needs to cast as type not implicitly stated
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTemplate", for: indexPath) as? TableViewCellTemplate else {
            return UITableViewCell()
        }
        
        // Update cell styling/text/design
/// SHOULD THIS BE LET? ALSO HOW TO RETURN UITABLEVIEWCELL IF FAILS?
        var Word: Word? = oneHundredEnglishWordsVolumeOne.dictionary[indexPath.row]
/// ASK WHY PRODUCT = PRODUCT TO UNWRAP
        if let Word = Word {
            cell.update(title: Word.title, type: Word.type, definition: Word.definition)
        }
        
        return cell
    }
}

// Extension for Table View Delegation --------------------------------------------------------------------------------------------
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(oneHundredEnglishWordsVolumeOne.dictionary[indexPath.row].title)")
/// WHY OPTIONAL?
        //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
}
*/
