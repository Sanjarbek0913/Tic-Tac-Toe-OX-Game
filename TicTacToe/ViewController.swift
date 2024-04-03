//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sanjarbek Abdurayimov on 28/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var firstUpView: UIView!{
        didSet{
            firstUpView.layer.cornerRadius = 2.5
            firstUpView.layer.shadowRadius = 10
            firstUpView.layer.shadowColor = #colorLiteral(red: 0.8002077341, green: 0.002912323223, blue: 0.05618589371, alpha: 1)
            firstUpView.layer.shadowOpacity = 0.5
            firstUpView.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    @IBOutlet weak var secondUpView: UIView!{
        didSet{
            secondUpView.layer.cornerRadius = 2.5
           secondUpView.layer.shadowRadius = 10
           secondUpView.layer.shadowColor = #colorLiteral(red: 0.8342550993, green: 0.001760327723, blue: 0.003877083072, alpha: 1)
           secondUpView.layer.shadowOpacity = 0.5
            secondUpView.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    @IBOutlet weak var thirdDownView: UIView!{
        didSet{
            thirdDownView.layer.cornerRadius = 2.5
           thirdDownView.layer.shadowRadius = 10
           thirdDownView.layer.shadowColor = #colorLiteral(red: 0.9236584902, green: 0, blue: 0.2471269071, alpha: 1)
           thirdDownView.layer.shadowOpacity = 0.5
           thirdDownView.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    @IBOutlet weak var fourDownView: UIView!{
        didSet{
            fourDownView.layer.cornerRadius = 2.5
           fourDownView.layer.shadowRadius = 10
           fourDownView.layer.shadowColor = #colorLiteral(red: 0.8683023453, green: 0.0004741547455, blue: 0.008260360919, alpha: 1)
           fourDownView.layer.shadowOpacity = 0.5
           fourDownView.layer.shadowOffset = CGSize(width: 0, height: 0)
        }
    }
    
    
    @IBOutlet var buttons: [UIButton]!
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var resetBtn: UIButton!{
        didSet{
            resetBtn.tintColor = .cyan
        }
    }
    
    
    
    var isXTurn: Bool = true
    
    var correctCases: [[Int]] = [
        [0,1,2], [0,3,6], [3,4,5], [1,4,7], [6,7,8], [2,5,8], [0,4,8], [2,4,6]
    ]
    
    var xAnswers = [Int]()
    var oAnswers = [Int]()
    
    var xIcon = ["X","👨","😀"]
    var oIcon = ["O","👱‍♀️","😂"]
    
    var currentIconForX = "X"
    var currentIconForO = "O"
    
    var oyinBoshlandimi = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in buttons {
            i.setTitle("", for: .normal)
        }
        resetBtn.isHidden = true
    }

    @IBAction func buttonsPressed(_ sender: UIButton) {
        oyinBoshlandimi = true
        if isXTurn {
            buttons[sender.tag].setTitle(currentIconForX, for: .normal)
            turnLabel.text = "Turn: \(currentIconForO)"
            xAnswers.append(sender.tag)
            for i in correctCases {
                if Set(i).isSubset(of: Set(xAnswers)) {
                    turnLabel.text = "\(currentIconForX) Win"
                    turnLabel.textColor = .green
                    resetBtn.isHidden = false
                    for j in buttons {
                        j.isUserInteractionEnabled = false
                    }
                    for b in buttons where i.contains(b.tag) {
                        b.backgroundColor = .green
                    }
                }
            }
        } else {
            turnLabel.text = "Turn: \(currentIconForX)"
            buttons[sender.tag].setTitle(currentIconForO, for: .normal)
            oAnswers.append(sender.tag)
            for i in correctCases {
                if Set(i).isSubset(of: Set(oAnswers)) {
                    turnLabel.text = "\(currentIconForO) Win"
                    turnLabel.textColor = .magenta
                    resetBtn.isHidden = false
                    for j in buttons {
                        j.isUserInteractionEnabled = false
                    }
                    for b in buttons where i.contains(b.tag) {
                        b.backgroundColor = .red
                    }
                }
            }
        }
        
        if (xAnswers + oAnswers).count == 9 {
            turnLabel.text = "Friendship!!!"
            turnLabel.textColor = .blue
            resetBtn.isHidden = false
        }
        buttons[sender.tag].isUserInteractionEnabled = false
        isXTurn = !isXTurn
         
    }
   
    @IBAction func chooseIconForX(_ sender: UIButton) {
        if !oyinBoshlandimi {
            let chooseIcon = xIcon.randomElement()
            currentIconForX = chooseIcon!
            sender.setTitle(chooseIcon, for: .normal)
        }
        
    }
    
    @IBAction func chooseIconForO(_ sender: UIButton) {
        if !oyinBoshlandimi {
            let chooseIcon = oIcon.randomElement()
            currentIconForO = chooseIcon!
            sender.setTitle(chooseIcon, for: .normal)
        }
        
    }
    
    
    @IBAction func resetBtnPressed(_ sender: UIButton) {
        oyinBoshlandimi = false

        for i in buttons {
            i.setTitle("", for: .normal)
            i.isUserInteractionEnabled = true
            i.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            xAnswers = []
            oAnswers = []
            isXTurn = true
            turnLabel.text = "Turn: \(currentIconForX)"
            turnLabel.textColor = .red
            resetBtn.isHidden = true
         }
    }
    
}

