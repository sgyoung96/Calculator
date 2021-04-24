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

        /*
         1. 숫자와 연산자를 각각 골라내어 String 배열로 만든다. (숫자 자릿수 상관x)
         2. 우선순위대로 연산을 시작한다.
         */

        let seperatedByText = Array(self.text)
        print("sepeatedByText : " + "\(seperatedByText)")
        
        // 1. 숫자와 연산자를 각각 골라내어 String 배열로 만든다. (숫자 자릿수 상관x)
        // 입력한 수식에서 연산자만 문자열로 발라내기
        var seperatedOperator = self.text.components(separatedBy: ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "."])
        print("seperatedOperator : " + "\(seperatedOperator)")
        var operatorArray: [String] = []
        for i in 0...seperatedOperator.count - 1 {
            if seperatedOperator[i] != "" {
                operatorArray.append(seperatedOperator[i]) // 공백을 제외한 연산자를 배열에 추가
            }
        }
        print("operatorArray : " + "\(operatorArray)")
        
        // 첫번째로 곱하기나 나누기 연산자가 오는 인덱스 구해내기
        var position: Int = 0
        for i in 0...seperatedByText.count - 1 {
            if seperatedByText[i] == "x" || seperatedByText[i] == "/" {
                position = i
                break
            }
        }
        print("position : " + "\(position)")
        
        var lastIndex = 0
        for i in 0...seperatedByText.count - 1 {
            lastIndex = i
        }
        print("lastIndex : " + "\(lastIndex)")
        
        var a: String
        var seperatedA: [String] = []
        var b: String
        var seperatedB: [String] = []
        if position > 0 {
            a = String(seperatedByText[0...position - 1])
            print("a : " + "\(a)")
            seperatedA = a.components(separatedBy: ["+", "-", "x", "/"])
            print("seperatedA : " + "\(seperatedA)")
            
            b = String(seperatedByText[position + 1...lastIndex])
            print("b : " + "\(b)")
            seperatedB = b.components(separatedBy: ["+", "-", "x", "/"])
            print("seperatedB : " + "\(seperatedB)")
        } else {
            let i = seperatedByText.count
            a = String(seperatedByText[0...i - 1])
            print("a : " + "\(a)")
            seperatedA = a.components(separatedBy: ["+", "-", "x", "/"])
            print("seperatedA : " + "\(seperatedA)")
            
            b = ""
            print("b : " + "\(b)")
            seperatedB = []
            print("seperatedB : " + "\(seperatedB)")
        }
        
        // 최종 문자열 배열 구해내기 (숫자와 연산자가 순서대로 입력되어 있는 배열)
        var finalArrayByNumber: [String] = seperatedA + seperatedB
        print("finalArrayOfNumbers : " + "\(finalArrayByNumber)")
        
        var finalArray: [String] = []
        for i in 0...operatorArray.count - 1 {
            finalArray.append(finalArrayByNumber[i])
            finalArray.append(operatorArray[i])
        }
        finalArray.append(finalArrayByNumber.last!)
        print("finalArray : " + "\(finalArray)")
        
        // *************************************************************************
        
        // 2. 우선순위대로 연산하기 시작!
        var index = 0
        guard index == finalArray.firstIndex(of: "/") else {
            return index = 0
        }
        
        if index > 0 {
            result = Double(finalArray[index - 1])! / Double(finalArray[index + 1])!
            finalArray.remove(at: index - 1)
            finalArray.remove(at: index)
            finalArray.remove(at: index + 1)
            finalArray.insert(String(result), at: index - 1)
            print(finalArray)
        } else if index == 0 {
            guard index == finalArray.firstIndex(of: "x") else {
                return index = 0
            }
            if index > 0 {
                
            } else if index == 0 {
                guard index == finalArray.firstIndex(of: "-") else {
                    return index = 0
                }
                if index > 0 {
                    
                } else if index == 0 {
                    guard index == finalArray.firstIndex(of: "+") else {
                        return index = 0
                    }
                    if index > 0 {
                        
                    } else if index == 0 {
                        result = 0
                    }
                }
            }
        }
        
        
        
//        var resultA = seperatedA.last
//        var resultB = seperatedB.first
//        var doubleResultA = Double(resultA!)
//        var doubleResultB = Double(resultB!)
//
//        var tempResult: Double = 0
//        if seperatedByText[position] == "x" {
//            tempResult = doubleResultA! * doubleResultB!
//            print("tempResult : " + "\(tempResult)")
//        } else if seperatedByText[position] == "/" {
//            tempResult = doubleResultA! / doubleResultB!
//            print("tempResult : " + "\(tempResult)")
//        }
//
//        // 다음 곱하기와 나누기가 오는 연산자의 위치 구하기
//        for i in position + 1...seperatedByText.count - 1 {
//            if seperatedByText[i] == "x" || seperatedByText[i] == "/" {
//                position = i
//                break
//            }
//        }
//        print("position : " + "\(position)")
//
//        var tempResult2: Double = 0
//        if seperatedByText[position] == "x" {
//            tempResult2 = tempResult * Double(seperatedB[0])!
//        } else if seperatedByText[position] == "/" {
//            tempResult2 = tempResult / Double(seperatedB[0])!
//        }
    
        lblTextArea.text = String(result)

    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblTextArea.text = ""
        self.text = ""
    }
}

