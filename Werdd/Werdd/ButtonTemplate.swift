//
//  ButtonTemplate.swift
//  Werdd
//
//  Created by Daniel Cruz Castro on 4/11/22.
//

import Foundation
import UIKit

class ButtonTemplate: UIButton {
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Blanks out button if enabled
    override var isEnabled: Bool {
        didSet {
            alpha = isEnabled ? 1:0.3
        }
    }
    
    //Override init----------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeUI()
    }
    
    // Functions -------------------------------------------------
    
    // ASK!!!!!!!!!
    private func arrangeUI() {
        tintColor = .black // Color of text
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: symbolConfiguration)
        setImage(image, for: .normal)
        addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
    }
    
    @objc func refreshButtonPressed() {
        print("Button Pressed")
    }
}
