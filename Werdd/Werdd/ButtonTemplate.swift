//
//  ButtonTemplate.swift
//  Werdd
//  This file stylizes the refresh button through superclassing. Button implementation is done in main ViewController file
//  Created by Daniel Cruz-Castro on 4/11/22.
//

import Foundation
import UIKit

class ButtonTemplate: UIButton {
//    var buttonCounter
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    //Blanks out button if enabled
//    override var isEnabled: Bool {
//        didSet {
//            alpha = isEnabled ? 1:0.3
//        }
//    }
    
    // Override init-------------------------------------------------------------------------------
    override init(frame: CGRect) {
        super.init(frame: frame)
        arrangeUI()
    }
    
    // Functions ---------------------------------------------------------------------------------
    private func arrangeUI() {
        tintColor = UIColor(named: "WerddColor")
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 30, weight: .medium, scale: .medium)
        let image = UIImage(systemName: "arrow.triangle.2.circlepath.circle", withConfiguration: symbolConfiguration)
        setImage(image, for: .normal)
//        addTarget(self, action: #selector(refreshButtonPressed), for: .touchUpInside)
    }
    
//    @objc func refreshButtonPressed() {
//        buttonCounter += 1
//        ViewController.updateViews(ViewController.dict)
//        print("Button Pressed: \(buttonCounter)")
//    }
}
