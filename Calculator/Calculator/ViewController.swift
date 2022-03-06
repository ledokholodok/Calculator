import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputLineLabel: UILabel!
        
    var number: Double!
    var operation: String!
    var answer: String = ""
    var operationPressed = false
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if (operationPressed) {
            inputLineLabel.text! = ""
            operationPressed = false
        }

        let buttonNumber = sender.currentTitle!
        inputLineLabel.text! += buttonNumber
    }

    @IBAction func operationPressed(_ sender: UIButton) {
        if answer == "" {
            answer = inputLineLabel.text!
            inputLineLabel.text! = ""
            operation = sender.currentTitle!
        } else {
            number = Double(inputLineLabel.text!)
            inputLineLabel.text! = ""
            calculate()
            operation = sender.currentTitle!
            number = 0
        }

        operationPressed = true
    }
    
    func calculate() {
        var doubleAnswer = Double(answer)!
        switch operation {
            case "+":
                doubleAnswer += number
            case "-":
                doubleAnswer -= number
            case "×":
                doubleAnswer *= number
            case "÷":
                if number == 0 {
                    inputLineLabel.text! = "Error"
                    break
                } else {
                    doubleAnswer /= number
                }
            default:
                print("Nonsens")
        }
        
        answer = String(doubleAnswer)
        getAnswer()
    }
    
    @IBAction func equalPressed(_ sender: UIButton) {
        inputLineLabel.text! = answer
        getAnswer()
    }
    
    func getAnswer() {
        if answer.hasSuffix(".0") {
            inputLineLabel.text! = answer.replacingOccurrences(of: ".0", with: "")
            
        } else {
            inputLineLabel.text! = answer
        }
    }
    
    @IBAction func allClearPressed(_ sender: UIButton) {
        inputLineLabel.text! = ""
        number = 0
        answer = ""
    }

    @IBAction func plusMinusPressed(_ sender: UIButton) {
        if inputLineLabel.text!.hasPrefix("-") {
            inputLineLabel.text!.removeFirst()
        } else {
            inputLineLabel.text!.insert("-", at: inputLineLabel.text!.startIndex)
        }
    }

    @IBAction func percentPressed(_ sender: UIButton) {
        if inputLineLabel.text != "" {
            let percentValue = Double(inputLineLabel.text!)! * 0.01
            inputLineLabel.text! = String(percentValue)
        }
    }
}
