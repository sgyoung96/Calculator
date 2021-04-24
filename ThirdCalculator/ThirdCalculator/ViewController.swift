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

//        // 연산자 우선순위 적용 (모든 digit 를 1개 단위로 잘라내어 배열로 저장하고 이 데이터를 가지고 핸들링 한다.)
//        /*
//         1. 곱하기, 나누기를 기준으로 문자열 잘라내기
//         2. 잘라낸 문자열을 각각 앞과 뒤로 분리해 변수에 담기
//         3. 앞 변수의 맨 뒤 인덱스와 뒤 변수의 맨 앞 인덱스를 곱하기나 나누기 연산 하기
//         */
//
        let seperatedByText = Array(self.text)
        print("sepeatedByText : " + "\(seperatedByText)")
        
            
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
        
        var a: String = String(seperatedByText[0...position - 1])
        print("a : " + "\(a)")
        var seperatedA = a.components(separatedBy: ["+", "-", "x", "/"])
        print("seperatedA : " + "\(seperatedA)")
        
        var b: String = String(seperatedByText[position + 1...lastIndex])
        print("b : " + "\(b)")
        var seperatedB = b.components(separatedBy: ["+", "-", "x", "/"])
        print("seperatedB : " + "\(seperatedB)")
        
        var resultA = seperatedA.last
        var resultB = seperatedB.first
        var doubleResultA = Double(resultA!)
        var doubleResultB = Double(resultB!)
        
        var tempResult: Double = 0
        if seperatedByText[position] == "x" {
            tempResult = doubleResultA! * doubleResultB!
            print("tempResult : " + "\(tempResult)")
        } else if seperatedByText[position] == "/" {
            tempResult = doubleResultA! / doubleResultB!
            print("tempResult : " + "\(tempResult)")
        }
        
        // 다음 곱하기와 나누기가 오는 연산자의 위치 구하기
        for i in position + 1...seperatedByText.count - 1 {
            if seperatedByText[i] == "x" || seperatedByText[i] == "/" {
                position = i
                break
            }
        }
        print("position : " + "\(position)")
        
        var tempResult2: Double = 0
        if seperatedByText[position] == "x" {
            tempResult2 = tempResult * Double(seperatedB[0])!
        } else if seperatedByText[position] == "/" {
            tempResult2 = tempResult / Double(seperatedB[0])!
        }
    
        lblTextArea.text = String(result)

    }
    
    @IBAction func btnClear(_ sender: UIButton) {
        lblTextArea.text = ""
        self.text = ""
    }
}

