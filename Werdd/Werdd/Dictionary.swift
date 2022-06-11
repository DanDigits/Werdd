//
// Dictionary.swift  -  Werdd
// Created by: Daniel Cruz Castro on 6/10/22
// Details information and specification on the words presented in the app


import Foundation

protocol Word {
    var title: String { get }
    var type: String { get }
    var definition: String { get }
}

class Dictionary {
    let dictionary: [Word] = [
        Grammar(title: "Bus", type: "noun", definition: "Vehicle primarily intended to carry numerous people"),
        Grammar(title: "Tire", type: "noun", definition: "Protective treading on wheels to improve acceleration"),
        Grammar(title: "Swift", type: "noun", definition: "Apple's native and proprietary programming language"),
        Grammar(title: "Alerted", type: "adjective", definition: "To be in a state of heightened awareness"),
        Grammar(title: "Barack Obama", type: "noun", definition: "44th President of the United States"),
        Grammar(title: "Scary", type: "adjective", definition: "To elicit feelings of fear"),
        Grammar(title: "Test", type: "TEST", definition: "TESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTESTES"),
        Grammar(title: "Rocket", type: "noun", definition: "A jet engine that operates on the same principle as the firework rocket, consists essentially of a combustion chamber and an exhaust nozzle, carries either liquid or solid propellants which provide the fuel and oxygen needed for combustion and thus make the engine independent of the oxygen of the air, and is used especially for the propulsion of a missile (such as a bomb or shell) or a vehicle (such as an airplane)"),
    ]
}

class Grammar: Word {
    var title: String
    var type: String
    var definition: String
    
    init(title: String, type: String, definition: String) {
        self.title = title
        self.type = type
        self.definition = definition
    }
}
