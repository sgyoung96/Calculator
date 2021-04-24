//
//  ViewController.swift
//  FirstCalculator
//
//  Created by Gayeong on 2021/04/23.
//

import UIKit

class ViewController: UIViewController {
    
    // 라벨에 뿌려줄 값을 담은 변수
    var text: String = ""
    
//    // 최종값
//    var result: String = ""
//
//    // 숫자 버튼의 값을 담고 있을 변수
//    var number: Double = 0
//
    // 사칙연산을 담을 변수
    var flag: String = ""
    
    // 계산값을 뿌려줄 공간
    @IBOutlet var lblTextArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblTextArea.text = ""
    }

    func showText(text: String) {
        self.text = text
        lblTextArea.text = lblTextArea.text! + self.text
    }
    
    func addNumber(operator: String) {
//        var addResult: Double = Double((lblTextArea.text?.components(separatedBy: ["+"])[0])!)! + Double((lblTextArea.text?.components(separatedBy: ["+"])[1])!)!
        
        var addResult: Double = 0
        guard var operatorResult = lblTextArea.text?.components(separatedBy: "+").count else {
            return
        }
        
        for i in 0...operatorResult - 1 {
            addResult = addResult + Double((lblTextArea.text?.components(separatedBy: ["+"])[i])!)!
        }
        
        lblTextArea.text =  String(addResult)
    }
    
    func minusNumber(operator: String) {
        // 현재 - 한 번만 계산 되고, - 두번 쓰는 것은 안 됨.
//        var minusResult: Double = Double((lblTextArea.text?.components(separatedBy: ["-"])[0])!)!
        var numberArray = lblTextArea.text?.components(separatedBy: "-")
        
        guard var operatorResult = lblTextArea.text?.components(separatedBy: "-").count else {
            return
        }
        
//        var result = Double(numberArray![0])! - Double(numberArray![1])!
//        result = minusResult - Double(numberArray![2])!
        var result = Double(numberArray![0])!
        
        for i in 1...operatorResult - 1 {
            result = result - Double(numberArray![i])!
        }
        
        lblTextArea.text = String(result)
    }
    
    func multiplyNumber(operator: String) {
        var multiplyResult: Double = 1
        
        guard var operatorResult = lblTextArea.text?.components(separatedBy: "x").count else {
            return
        }
        
        for i in 0...operatorResult - 1 {
            multiplyResult = multiplyResult * Double((lblTextArea.text?.components(separatedBy: "x")[i])!)!
        }
        
        lblTextArea.text = String(multiplyResult)
        
    }
    
    func divideNumber(operator: String) {
        var numberArray = lblTextArea.text?.components(separatedBy: "/")
        
        var operatorResult = lblTextArea.text?.components(separatedBy: "/").count
        
//        var dividedResult = Double(numberArray![0])! / Double(numberArray![1])!
//        dividedResult = dividedResult / Double(numberArray![2])!
        var dividedResult = Double(numberArray![0])!
        
        for i in 1...operatorResult! - 1 {
            dividedResult = dividedResult / Double(numberArray![i])!
        }
        
        lblTextArea.text = String(dividedResult)
        
    }

    @IBAction func btnOne(_ sender: UIButton) {
        showText(text: "1")
    }
    
    @IBAction func btnTwo(_ sender: UIButton) {
        showText(text: "2")
    }
    
    @IBAction func btnThree(_ sender: UIButton) {
        showText(text: "3")
    }
    
    @IBAction func btnFour(_ sender: UIButton) {
        showText(text: "4")
    }
    
    @IBAction func btnFive(_ sender: UIButton) {
        showText(text: "5")
    }
    
    @IBAction func btnSix(_ sender: UIButton) {
        showText(text: "6")
    }
    
    @IBAction func btnSeven(_ sender: UIButton) {
        showText(text: "7")
    }
    
    @IBAction func btnEight(_ sender: UIButton) {
        showText(text: "8")
    }
    
    @IBAction func btnNine(_ sender: UIButton) {
        showText(text: "9")
    }
    
    @IBAction func btnZero(_ sender: UIButton) {
        showText(text: "0")
    }
    
    @IBAction func btnAdd(_ sender: UIButton) {
        showText(text: "+")
        self.flag = "+"
    }
    
    @IBAction func btnMinus(_ sender: UIButton) {
        showText(text: "-")
        self.flag = "-"
    }
    
    @IBAction func btnMultiply(_ sender: UIButton) {
        showText(text: "x")
        self.flag = "x"
    }
    
    @IBAction func btnDivide(_ sender: UIButton) {
        showText(text: "/")
        self.flag = "/"
    }
    
    @IBAction func btnDot(_ sender: UIButton) {
        showText(text: ".")
    }
    
    @IBAction func btnResult(_ sender: UIButton) {
        if flag == "+" {
            addNumber(operator: "+")
        } else if flag == "-" {
            minusNumber(operator: "-")
        } else if flag == "x" {
            multiplyNumber(operator: "x")
        } else if flag == "/" {
            divideNumber(operator: "/")
        }
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblTextArea.text = ""
        self.text = ""
    }
}

