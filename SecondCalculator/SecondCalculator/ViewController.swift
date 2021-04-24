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
    }
    
    @IBAction func btnMinus(_ sender: UIButton) {
        showText(text: "-")
    }
    
    @IBAction func btnMultiply(_ sender: UIButton) {
        showText(text: "x")
    }
    
    @IBAction func btnDivide(_ sender: UIButton) {
        showText(text: "/")
    }
    
    @IBAction func btnDot(_ sender: UIButton) {
        showText(text: ".")
    }
    
    @IBAction func btnResult(_ sender: UIButton) {

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

    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblTextArea.text = ""
        self.text = ""
    }
}

