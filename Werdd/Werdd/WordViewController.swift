//
//  WordViewController.swift
//  Werdd
//  Secondary Object View Controller
//  Created by Daniel Cruz-Castro on 12/17/22.
//
//  To Do:
//  - Implement a Stack View

import UIKit

class WordViewController: UIViewController {
    private var indexPath: Int
    private var Volume = Dictionary()
    
    let definitionCard: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.layer.cornerRadius = 15
        view.backgroundColor = UIColor(named: "CardColor")
        return view
    }()
    
    let definitionHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Definition"
        label.textAlignment = .left
        label.textColor = UIColor(named: "WerddColor")
        return label
    }()
    
    let partOfSpeech: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "AHHHHHHHHHH"
        label.font = UIFont(name: "PTSerif-Italic", size: 15)
        label.textAlignment = .left
        return label
    }()
    
    let definitionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        label.text = "AHHHHHHHHHH"
        return label
    }()
    
    
    let exampleCard: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.layer.cornerRadius = 15
        view.backgroundColor = .orange
        return view
    }()
    
    let exampleHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Examples"
        label.textAlignment = .left
        label.textColor = UIColor(named: "WerddColor")
        return label
    }()
    
    let exampleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    
    let synonymCard: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.layer.cornerRadius = 15
        view.backgroundColor = .green
        return view
    }()
    
    let synonymHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Synonyms"
        label.textAlignment = .left
        label.textColor = UIColor(named: "WerddColor")
        return label
    }()
    
    let synonymLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    
    let antonymCard: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.layer.cornerRadius = 15
        view.backgroundColor = .red
        return view
    }()
    
    let antonymHeaderLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Antonyms"
        label.textAlignment = .left
        label.textColor = UIColor(named: "WerddColor")
        return label
    }()
    
    let antonymLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
//    let tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.register(TableViewCellTemplate.self, forCellReuseIdentifier: "TableViewCellTemplate") // Register custom tableView cell to table view
//        tableView.layer.cornerRadius = 25
//        tableView.backgroundColor = .systemPink
//        tableView.separatorStyle = .none
//        return tableView
//    }()
    
    
    
    
//MARK: Lifecycle ------------------------------------------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Configure Navigation settings
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = Volume.dictionary[indexPath].title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "WerddColor")

        // Set up UI
        arrangeUI()
    }
    
//MARK: Functions -------------------------------------------------------------------------------------------------------------------
    // ViewController initializer to pass in data from root controller
    init(indexPath: Int, Volume: Dictionary) {
        self.indexPath = indexPath
        self.Volume = Volume
        
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Arranges UI
    func arrangeUI() {
        definitionCard.addArrangedSubview(definitionHeaderLabel)
        definitionCard.addArrangedSubview(definitionLabel)
        definitionCard.addArrangedSubview(partOfSpeech)
        synonymCard.addSubview(synonymHeaderLabel)
        synonymCard.addSubview(synonymLabel)
        antonymCard.addSubview(antonymHeaderLabel)
        antonymCard.addSubview(antonymLabel)
        exampleCard.addSubview(exampleHeaderLabel)
        exampleCard.addSubview(exampleLabel)
        view.addSubview(exampleCard)
        view.addSubview(antonymCard)
        view.addSubview(synonymCard)
        view.addSubview(definitionCard)
        
        NSLayoutConstraint.activate([
            // Definition Card
            definitionCard.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            definitionCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            definitionCard.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            definitionCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
            
            // Synonym Card
            synonymCard.topAnchor.constraint(equalTo: definitionCard.bottomAnchor, constant: 20),
            synonymCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            synonymCard.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            synonymCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            
            // Antonym Card
            antonymCard.topAnchor.constraint(equalTo: synonymCard.bottomAnchor, constant: 20),
            antonymCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            antonymCard.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            antonymCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            
            // Example Card
            exampleCard.topAnchor.constraint(equalTo: antonymCard.bottomAnchor, constant: 20),
            exampleCard.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            exampleCard.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            exampleCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.12),
            
        ])
        
    }
    
    
}









//MARK: DEPRECATED TABLE VIEW CODE
// Extension for Table View Data Source --------------------------------------------------------------------------------------------
//extension ViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return Volume.dictionary.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        // Guard lets you direct what happens should any error occur (the "else" statement), needs to cast as type not implicitly stated
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCellTemplate", for: indexPath) as? TableViewCellTemplate else {
//            return UITableViewCell()
//        }
//
//        // Update cell styling/text/design
///// SHOULD THIS BE LET? ALSO HOW TO RETURN UITABLEVIEWCELL IF FAILS?
//        var Word: Word? = Volume.dictionary[indexPath.row]
///// ASK WHY PRODUCT = PRODUCT TO UNWRAP
//        if let Word = Word {
//            cell.update(title: Word.title, type: Word.type, definition: Word.definition)
//        }
//
//        return cell
//    }
//}
//
//// Extension for Table View Delegation --------------------------------------------------------------------------------------------
//extension ViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("\(Volume.dictionary[indexPath.row].title)")
///// WHY OPTIONAL?
//        //navigationController?.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: <#T##Bool#>)
//    }
//}
