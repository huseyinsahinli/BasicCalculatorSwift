//
//  ViewController.swift
//  basicCalculator
//
//  Created by Hüseyin ŞAHİNLİ on 16.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var numberOneTextField: UITextField!
    @IBOutlet weak var numberTwoTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
  
    func calculateWithType(type:String) {
        guard let numberOne = numberOneTextField.text, !numberOne.isEmpty else {
                showAlert(withMessage: "Please enter the Number One.")
            return
           
            }
            
            guard let numberTwo = numberTwoTextField.text, !numberTwo.isEmpty else {
                showAlert(withMessage: "Please enter the Number Two.")
                return
          
            }
            
        guard let doubleOne = Double(numberOne), let doubleTwo = Double(numberTwo) else {
               showAlert(withMessage: "Invalid number format.")
               return
           }
        var result:Double = 0.0
        switch type {
            case "+":
                 result = doubleOne + doubleTwo
            case "-":
                result = doubleOne - doubleTwo
            case "*":
            result = doubleOne * doubleTwo
            case "/":
            result = doubleOne / doubleTwo
            default:
                showAlert(withMessage: "Invalid operator.")
            result = 0
            }
        resultLabel.text=String(result)
    }
    @IBAction func sumButton(_ sender: Any) {
        calculateWithType(type: "+")
    }
    
    @IBAction func minusButton(_ sender: Any) {
        calculateWithType(type: "-")
    }
    
    @IBAction func multiplyButton(_ sender: Any) {
        calculateWithType(type: "*")
    }
    
    @IBAction func divideButton(_ sender: Any) {
        calculateWithType(type: "/")
        
    }
    func showAlert(withMessage message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

