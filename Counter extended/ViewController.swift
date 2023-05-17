//
//  ViewController.swift
//  Counter extended
//
//  Created by Admin on 16.05.2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyOfChanges: UITextView!
    
    private var valueCounter: UInt64 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        plusButton.layer.cornerRadius = plusButton.frame.size.height / 2
        plusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = UIColor.black.cgColor
        minusButton.layer.cornerRadius = minusButton.frame.size.height / 2
        minusButton.layer.borderWidth = 1
        plusButton.layer.borderColor = UIColor.black.cgColor
        resetButton.tintColor = UIColor.black
        counterLabel.text = "Значение счетчика \(valueCounter)"
        historyOfChanges.text = "История изменений:\n"
    }
    
    private func date() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "dd.MM.YYYY HH:mm:ss"
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    private func scroll() {
        let range = NSRange(location: historyOfChanges.text.count - 1, length: 0)
        historyOfChanges.scrollRangeToVisible(range)
    }
    
    private func value() {
        counterLabel.text = "Значение счетчика \(valueCounter)"
    }
    
    @IBAction private func addValue(_ sender: Any) {
        valueCounter += 1
        value()
        historyOfChanges.text += "[\(date())] Значение изменено на + 1\n"
        scroll()
    }
    @IBAction private func subtrackValue(_ sender: Any) {
        if valueCounter != 0 {
            valueCounter -= 1
            historyOfChanges.text += "[\(date())] Значение изменено на - 1\n"
            scroll()
        } else {
            historyOfChanges.text += "[\(date())] попытка уменьшить значение счётчика ниже 0\n"
            scroll()
        }
        value()
    }
    @IBAction private func resetValue(_ sender: Any) {
        valueCounter = 0
        value()
        historyOfChanges.text += "[\(date())] Значение сброшено\n"
        scroll()
    }
    
}

