//
//  ViewController.swift
//  Werdd
//  Root View Controller
//  Created by Daniel Cruz-Castro on 3/17/22.
//
//  To Do:
//  - Fix ScrollView
//
//  - Custom color function?
//  - Clean up code through subclassing and extensions

import UIKit

// Codable protocol lets us encode/decode, decoding = JSON -> data models, encode data model -> JSON. They have to be verbatim to the field values in the API/JSON. Value types must be correct too.
//struct User: Codable {
//    let name: String
//    let username: String
//    let email: String
//}

class ViewController: UIViewController {
    var buttonCounter: Int = 0
    var Volume = Dictionary()
    var VolumeTwo: [String] = []
    //extension UIColor {
    //    static let backgroundColor = UIColor(named: "WerddColor")
    //    static let werddColor = UIColor(named: "CardColor")
    
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
        //button.addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
        button.addTarget(self, action: #selector(fetchDictionary), for: .touchUpInside)
        return button
    }()
    
//  Lazy?, Does layout/collectionView order matter?
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        // Layout Settings
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width/3.5, height: view.frame.size.width/3.5)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        // CollectionView Settings
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout) // Set to zero to allow autolayout modification
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CollectionViewCellTemplate.self, forCellWithReuseIdentifier: CollectionViewCellTemplate.identifier)
        collectionView.backgroundColor = UIColor(named: "StandColor")
        collectionView.layer.cornerRadius = 25
        return collectionView
    }()
    
//MARK: Lifecycle -----------------------------------------------------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Hide Navigation bar for root controller
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set background color
        view.backgroundColor = UIColor(named: "WerddColor")
        
        // UICollectionViewDataSource and UICollectionViewDelegate delegate work to ViewController through these settings
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Set up UI
        arrangeUI()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Configure navigation related settings
        navigationController?.setNavigationBarHidden(false, animated: true)
    }

//MARK: Functions -----------------------------------------------------------------------------------------------------------------------------
    // Update views with new information
    func updateViews(withDictionary dictionary: Word) {
///     ASK!!!!!! Why ? in instruction video and what "withDictionary"
        wordLabel.text = dictionary.title
        typeLabel.text = dictionary.type
        definitionLabel.text = dictionary.definition
    }
    
    // Randomize which word is pulled from the dictionary (and shown)
    func randomizeWord() -> Word? {
///     ASKK!!!!!! how to provide an operator in case dictionary fail with ??
        return Volume.dictionary.randomElement()
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
            scrollView.topAnchor.constraint(equalTo: appLabel.bottomAnchor, constant: 20),
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
            
            typeLabel.topAnchor.constraint(equalTo: wordLabel.topAnchor, constant: 17), /// Would it be better to specify bottom text alignment and have typeLabel instead bottom anchor to worldlabel bottom anchor? Then location next to word label should be based on vertical device size and not respective constraints?
            typeLabel.leadingAnchor.constraint(equalTo: wordLabel.trailingAnchor, constant: 10),
            typeLabel.trailingAnchor.constraint(lessThanOrEqualTo: cardView.trailingAnchor),
            
            // Definition body label
            definitionLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            definitionLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 23),
            definitionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -23),
//            definitionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor), //--------------> Related to veritcal scrolling
            
            // Table view
            collectionView.topAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 29),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    @objc func fetchDictionary() {
        guard let wordURL = URL(string: "https://random-words5.p.rapidapi.com/getMultipleRandom?count=20") else {
            print("Invalid URL")
            return
        }
        
        // Create URL object, and add values to the HTTP header field, check API documentation to see whats necessary in urlrequest header fields
        var urlRequest = URLRequest(url: wordURL)
        urlRequest.httpMethod = "GET"
        urlRequest.setValue("random-words5.p.rapidapi.com", forHTTPHeaderField: "X-RapidAPI-Host")
        urlRequest.setValue("3663639591mshbec2c73c703eec3p104b64jsnffa9171d5ea0", forHTTPHeaderField: "X-RapidAPI-Key")
        
        // To start a networking task, start a session. Data, response, error are closure parameter values; are all optionals
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            // If method can throw an error, wrap in a do/catch/try block
            do {
                print(data) // Print data size
                let Volume = try JSONDecoder().decode([String].self, from: data) // Creates array of strings in "VolumeTwo"
                self.VolumeTwo = Volume
                print(Volume)
                DispatchQueue.main.async { [weak self] in
                    self?.wordLabel.text = Volume.randomElement()
                }
            } catch {print(error)}
        }.resume()
    }
}

//MARK: Extensions ---------------------------------------------------------------------------------------------------------------------------
extension ViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // What cell to use for each column/row
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellTemplate.identifier, for: indexPath) as? CollectionViewCellTemplate else {
            return CollectionViewCellTemplate()
        }
///     WHY?
        let Word: Word? = Volume.dictionary[indexPath.row]
        if let Word = Word {
            cell.update(title: Word.title, definition: Word.definition)
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Volume.dictionary.count
        //return VolumeTwo[index]
    }
}


extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("\(Volume.dictionary[indexPath.row].title)")
        navigationItem.title = Volume.dictionary[indexPath.row].title
        navigationController?.pushViewController(WordViewController(indexPath: indexPath.row, Volume: Volume), animated: true)
    }
}










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
        return Volume.dictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Guard lets you direct what happens should any error occur (the "else" statement), needs to cast as type not implicitly stated
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTemplate", for: indexPath) as? TableViewCellTemplate else {
            return UITableViewCell()
        }
        
        // Update cell styling/text/design
/// SHOULD THIS BE LET? ALSO HOW TO RETURN UITABLEVIEWCELL IF FAILS?
        var Word: Word? = Volume.dictionary[indexPath.row]
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
        print("\(Volume.dictionary[indexPath.row].title)")
/// WHY OPTIONAL?
        //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
    }
}
*/
