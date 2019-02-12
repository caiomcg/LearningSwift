//
//  ViewController.swift
//  ButtonPresses
//
//  Created by Caio Guedes on 12/02/19.
//  Copyright © 2019 Caio Guedes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        connectLongPress()
        connectSwipe()
    }

    @IBAction func didPress(_ sender: Any) {
        updateLabel()
    }
    
    func updateLabel(by: Int = 1) {
        if let text = label.text {
            label.text = String(Int(text)! + by)
        }
    }
}

extension ViewController {
    @objc func handleswipeRight(_ guesture: UISwipeGestureRecognizer) {
        updateLabel(by: 10)
    }
    
    func connectSwipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(handleswipeRight(_:)))
        swipe.direction = .up
        self.view.addGestureRecognizer(swipe)
    }
}

extension ViewController {
    @objc func handleLongPress(_ guesture: UILongPressGestureRecognizer) {
        self.label.text = "0"
    }
    
    func connectLongPress() {
        let longPress = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        self.button.addGestureRecognizer(longPress)
    }
}
