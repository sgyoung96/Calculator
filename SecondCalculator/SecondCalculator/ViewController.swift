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
    
    // 최종값
    var result: Double = 0

    // 사칙연산을 담을 변수
    var flag: String = ""
    
    // 숫자 버튼의 값을 담고 있을 변수
    var numberPrev: Double = 0
    var numberNext: Double = 0
    var numberArray: [Double] = [Double]()

    // 계산값을 뿌려줄 공간
    @IBOutlet var lblTextArea: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lblTextArea.text = ""
    }

    func showText(text: String) {
//        self.text = text
//        lblTextArea.text = lblTextArea.text! + self.text
        
        self.text = self.text + text
        lblTextArea.text = self.text
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
        var numberArray = lblTextArea.text?.components(separatedBy: "-")
        
        guard var operatorResult = lblTextArea.text?.components(separatedBy: "-").count else {
            return
        }
        
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
        
//        var resultArray = Array(self.text)
//
//        print(resultArray)
//
//        var doubleArray = [Double](resultArray)

        // 입력한 수식에서 숫자만 문자열로 발라내기
        var seperatedNumber = self.text.components(separatedBy: ["+", "-", "x", "/"])
        print(seperatedNumber)
        
        // 입력한 수식에서 연산자만 문자열로 발라내기
        var seperatedOperator = self.text.components(separatedBy: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."])
        seperatedOperator.removeFirst()
        seperatedOperator.removeLast()
        var operatorArray: [String] = []
        for i in 0...seperatedOperator.count - 1 {
            if seperatedOperator[i] != "" {
                operatorArray.append(seperatedOperator[i])
            }
        }
        print(operatorArray)
        
        // 숫자로 발라낸 문자열을 숫자형으로 형변환하기
        var changeNumberFromString: [Double] = []
        for i in 0...seperatedNumber.count - 1 {
            changeNumberFromString.append(Double(seperatedNumber[i])!)
        }
        print(changeNumberFromString)
        
        // 수식을 합쳐서 계산식으로 만들기
        var result: Double = changeNumberFromString[0]
        for i in 0...operatorArray.count - 1 {
            // 연산자 수만큼 돌면서 계산
            /*
             i = 0 일 때,
             만약 첫번째 연산자가 + 이면, 첫번째 숫자[i = 0]와 두번째 숫자[i = 1]를 더한다[i = 0].
             만약 첫번째 연산자가 - 이면, 첫번째 숫자와 두번째 숫자를 뺀다.
             만약 첫번째 연산자가 x 이면, 첫번째 숫자와 두번째 숫자를 곱한다.
             만약 첫번째 연산자가 / 이면, 첫번째 숫자와 두번째 숫자를 나눈다.
             
             i = 1 일 때,
             만약 두번째 연산자가 + 이면, 연산된 결과와 세번째 숫자[i = 2] 를 더한다[i = 1].
             만약 두번째 연산자가 - 이면, 연산된 결과와 세번째 숫자[i = 2] 를 뺀다.
             만약 두번째 연산자가 x 이면, 연산된 결과와 세번째 숫자[i = 2] 를 곱한다.
             만약 두번째 연산자가 / 이면, 연산된 결과와 세번째 숫자[i = 2] 를 나눈다.
             
             i = 2 일 때,
             만약 세번째 연산자가 + 이면, 연산된 결과와 네번째 숫자[i = 3] 를 더한다[i = 2].
             만약 세번째 연산자가 - 이면, 연산된 결과와 네번째 숫자[i = 3] 를 뺀다.
             만약 세번째 연산자가 x 이면, 연산된 결과와 네번째 숫자[i = 3] 를 곱한다.
             만약 세번째 연산자가 / 이면, 연산된 결과와 네번째 숫자[i = 3] 를 나눈다.
            */
            
/*            if i == 0 {
                switch operatorArray[0] {
                case "+" :
                    result = changeNumberFromString[i] + changeNumberFromString[i + 1]
                case "-" :
                    result = changeNumberFromString[i] - changeNumberFromString[i + 1]
                case "x" :
                    result = changeNumberFromString[i] * changeNumberFromString[i + 1]
                case "/" :
                    result = changeNumberFromString[i] / changeNumberFromString[i + 1]
                default:
                    return
                }
                print(result)
            } else {
                switch operatorArray[i] {
                case "+" :
                    result = result + changeNumberFromString[i + 1]
                case "-" :
                    result = result - changeNumberFromString[i + 1]
                case "x" :
                    result = result * changeNumberFromString[i + 1]
                case "/" :
                    result = result / changeNumberFromString[i + 1]
                default:
                    return
                }
            }
 */
            
            switch operatorArray[i] {
            case "+" :
                result = result + changeNumberFromString[i + 1]
            case "-" :
                result = result - changeNumberFromString[i + 1]
            case "x" :
                result = result * changeNumberFromString[i + 1]
            case "/" :
                result = result / changeNumberFromString[i + 1]
            default:
                return
            }
            
            print(result)
        }
        
        lblTextArea.text = String(result)
        
        // 만약 이 연산자이면 해당하는 연산자 메소드 호출
//        if flag == "+" {
//            addNumber(operator: "+")
//        } else if flag == "-" {
//            minusNumber(operator: "-")
//        } else if flag == "x" {
//            multiplyNumber(operator: "x")
//        } else if flag == "/" {
//            divideNumber(operator: "/")
//        }
    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblTextArea.text = ""
        self.text = ""
    }
}

