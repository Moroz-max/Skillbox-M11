//
//  ViewController.swift
//  11 module
//
//  Created by Чернышев Роман on 14.01.2023.
//

import UIKit

class ViewController: UIViewController {

    var isNewValue = true
    var operation: MathOperation? = nil
    var previousOperation: MathOperation? = nil
    var result: Int = 0
    var NewValue: Int = 0
    
    @IBAction func onOne(_ sender: Any) {
        addDigit("1")
    }
    @IBAction func onTwo(_ sender: Any) {
        addDigit("2")
    }
    @IBAction func oneThree(_ sender: Any) {
        addDigit("3")
    }
    @IBAction func onFour(_ sender: Any) {
        addDigit("4")
    }
    @IBAction func onFive(_ sender: Any) {
        addDigit("5")
    }
    @IBAction func onSix(_ sender: Any) {
        addDigit("6")
    }
    @IBAction func onSeven(_ sender: Any) {
        addDigit("7")
    }
    @IBAction func onEight(_ sender: Any) {
        addDigit("8")
    }
    @IBAction func onNine(_ sender: Any) {
        addDigit("9")
    }
    @IBAction func onZero(_ sender: Any) {
        addDigit("0")
    }
    
    @IBAction func onPlus(_ sender: Any) {
        operation = .sum
        previousOperation = nil
        isNewValue = true
        result = getInteger()   
    }
    @IBAction func onMinus(_ sender: Any) {
        operation = .substruct
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onMulty(_ sender: Any) {
        operation = .multiplication
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onDivision(_ sender: Any) {
        operation = .division
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onDegree(_ sender: Any) {
        operation = .degree
        previousOperation = nil
        isNewValue = true
        result = getInteger()
    }
    @IBAction func onEqual(_ sender: Any) {
        calculate()
    }
    
    @IBAction func onReset(_ sender: Any) {
        isNewValue = true
        result = 0
        NewValue = 0
        operation = nil
        previousOperation = nil
        resultLabel.text = "0"
    }
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = ConstantStrings.CalculatorTitle
    }
    func addDigit(_ digit: String) {
        if isNewValue {
            resultLabel.text = ""
            isNewValue = false
        }
        var digits = resultLabel.text
        digits?.append(digit)
        resultLabel.text = digits
    }
    func getInteger() -> Int {
        return Int(resultLabel.text ?? "0") ?? 0
    }
    
    func calculate() {
        guard let operation = operation else {
            return
        }
        if previousOperation != operation {
            NewValue = getInteger()
        }
        result = operation.makeOperation(result: result, newValue: NewValue)
        previousOperation = operation
        
        resultLabel.text = "\(result)"
        isNewValue = true
    }

}

enum MathOperation {
    case sum, substruct, multiplication,division, degree
    
    func makeOperation(result: Int, newValue: Int) -> Int {
        switch self {
        case .sum:
            return (result + newValue)
        case .substruct:
            return (result - newValue)
        case .multiplication:
            return (result * newValue)
        case .division:
            return (result / newValue)
        case .degree:
            return (result * result)
        }
    }
}
