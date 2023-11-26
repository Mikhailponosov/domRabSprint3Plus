//
//  ViewController.swift
//  domRabSprint3Plus
//  
//  Created by admin on 22.11.2023.
//

import UIKit

class ViewController: UIViewController {
    var counter = 0
    @IBOutlet weak var buttonReset: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var counterLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        historyTextView.text = "История изменений:"
    }
    
    @IBAction func increaseCounter(_ sender: UIButton) {
        updateCounter(by: +1)
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    @IBAction func decreaseCounter(_ sender: UIButton) {
        updateCounter(by: -1)
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    @IBAction func resetCounter(_ sender: UIButton) {
        resetCounter()
        counterLabel.text = "Значение счетчика: \(counter)"
    }
    
    func updateCounter(by value: Int) {
        counter += value
        if counter < 0 {
            counter = 0
            logAttempt(attempt: "Попытка изменить значение нже 0")
        } else {
            logAttempt (attempt: "Значение изменено \(value)")
        }
        updateUI()
    }
    func resetCounter() {
        counter = 0
        logAttempt(attempt: "Значение сброшено")
        updateUI()
    }
    
    func logAttempt (attempt: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let dateString = dateFormatter.string(from: Date())
        historyTextView.text += "\n[\(dateString)]: \(attempt)"
    }
    
    func updateUI() {
        counterLabel.text = "\(counter)"
    }
}
