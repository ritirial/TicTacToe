//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alumno on 23/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    var userTurn = false
    var board = [
        "-", "-", "-",
        "-", "-", "-",
        "-", "-", "-"
    ]

    @IBOutlet weak var label1: UIButton!
    @IBOutlet weak var label2: UIButton!
    @IBOutlet weak var label3: UIButton!
    
    @IBOutlet weak var label4: UIButton!
    @IBOutlet weak var label5: UIButton!
    @IBOutlet weak var label6: UIButton!
    
    @IBOutlet weak var label7: UIButton!
    @IBOutlet weak var label8: UIButton!
    @IBOutlet weak var label9: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func handleTap(_ sender: UIButton) {
        if userTurn {
            if sender == label1 && board[0] == "-" {
                setMove(number: 0, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label2 && board[1] == "-" {
                setMove(number: 1, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label3 && board[2] == "-" {
                setMove(number: 2, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label4 && board[3] == "-" {
                setMove(number: 3, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label5 && board[4] == "-" {
                setMove(number: 4, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label6 && board[5] == "-" {
                setMove(number: 5, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label7 && board[6] == "-" {
                setMove(number: 6, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label8 && board[7] == "-" {
                setMove(number: 7, mark: "X")
                userTurn = false
                makeMove()
            } else if sender == label9 && board[8] == "-" {
                setMove(number: 8, mark: "X")
                userTurn = false
                makeMove()
            }
        }
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        board = [
            "-", "-", "-",
            "-", "-", "-",
            "-", "-", "-"
        ]
        
        label1.setTitle("-", for: .normal)
        label2.setTitle("-", for: .normal)
        label3.setTitle("-", for: .normal)
        label4.setTitle("-", for: .normal)
        label5.setTitle("-", for: .normal)
        label6.setTitle("-", for: .normal)
        label7.setTitle("-", for: .normal)
        label8.setTitle("-", for: .normal)
        label9.setTitle("-", for: .normal)
        
        userTurn = true
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Game over", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)

        alert.addAction(action)
        
        self.present(alert, animated: true)
    }
    
    func checkGameOver() -> Bool {
        var isGameOver = false
        
        if board[0] == "X" && board[1] == "X" && board[2] == "X" ||
            board[3] == "X" && board[4] == "X" && board[5] == "X" ||
            board[6] == "X" && board[7] == "X" && board[8] == "X" ||
            board[0] == "X" && board[3] == "X" && board[6] == "X" ||
            board[1] == "X" && board[4] == "X" && board[7] == "X" ||
            board[2] == "X" && board[5] == "X" && board[8] == "X" ||
            board[0] == "X" && board[4] == "X" && board[8] == "X" ||
            board[2] == "X" && board[4] == "X" && board[6] == "X"
        {
            isGameOver = true
            userTurn = false
            showAlert(message: "User WINS")
            
        }
        else if board[0] == "O" && board[1] == "O" && board[2] == "O" ||
                    board[3] == "O" && board[4] == "O" && board[5] == "O" ||
                    board[6] == "O" && board[7] == "O" && board[8] == "O" ||
                    board[0] == "O" && board[3] == "O" && board[6] == "O" ||
                    board[1] == "O" && board[4] == "O" && board[7] == "O" ||
                    board[2] == "O" && board[5] == "O" && board[8] == "O" ||
                    board[0] == "O" && board[4] == "O" && board[8] == "O" ||
                    board[2] == "O" && board[4] == "O" && board[6] == "O"
        {
            isGameOver = true
            userTurn = false
            showAlert(message: "Computer WINS")
            
        }
        else if board[0] != "-" && board[1] != "-" && board[2] != "-" &&
                board[3] != "-" && board[4] != "-" && board[5] != "-" &&
                board[6] != "-" && board[7] != "-" && board[8] != "-"
        {
            isGameOver = true
            userTurn = false
            showAlert(message: "It's a DRAW")
            
        }
        
        return isGameOver
    }
    
    func setMove(number: Int, mark: String) {
        board[number] = mark
        
        switch(number) {
        case 0:
            label1.setTitle(mark, for: .normal)
            break
        case 1:
            label2.setTitle(mark, for: .normal)
            break
        case 2:
            label3.setTitle(mark, for: .normal)
            break
        case 3:
            label4.setTitle(mark, for: .normal)
            break
        case 4:
            label5.setTitle(mark, for: .normal)
            break
        case 5:
            label6.setTitle(mark, for: .normal)
            break
        case 6:
            label7.setTitle(mark, for: .normal)
            break
        case 7:
            label8.setTitle(mark, for: .normal)
            break
        case 8:
            label9.setTitle(mark, for: .normal)
            break
        default:
            break
        }
    }
    
    func checkTwoInARow(check1: Int, check2: Int, check3: Int, checkMark: String, setMark: String) -> Bool {
        var moved = false
        if board[check1] == checkMark && board[check2] == checkMark && board[check3] == "-" {
            setMove(number: check3, mark: setMark)
            moved = true
        } else if board[check1] == checkMark && board[check3] == checkMark && board[check2] == "-" {
            setMove(number: check2, mark: setMark)
            moved = true
        } else if board[check2] == checkMark && board[check3] == checkMark && board[check1] == "-" {
            setMove(number: check1, mark: setMark)
            moved = true
        }
        return moved
    }
    
    func checkWin() -> Bool {
        var moved = checkTwoInARow(check1: 0, check2: 1, check3: 2, checkMark: "O", setMark: "O")
        if !moved {
            moved = checkTwoInARow(check1: 3, check2: 4, check3: 5, checkMark: "O", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 6, check2: 7, check3: 8, checkMark: "O", setMark: "O")
        }
        //column
        if !moved {
            moved = checkTwoInARow(check1: 0, check2: 3, check3: 6, checkMark: "O", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 1, check2: 4, check3: 7, checkMark: "O", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 2, check2: 5, check3: 8, checkMark: "O", setMark: "O")
        }
        //diagonal
        if !moved {
            moved = checkTwoInARow(check1: 0, check2: 4, check3: 8, checkMark: "O", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 2, check2: 4, check3: 6, checkMark: "O", setMark: "O")
        }
        return moved
    }
    
    func checkBlock() -> Bool {
        var moved = checkTwoInARow(check1: 0, check2: 1, check3: 2, checkMark: "X", setMark: "O")
        if !moved {
            moved = checkTwoInARow(check1: 3, check2: 4, check3: 5, checkMark: "X", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 6, check2: 7, check3: 8, checkMark: "X", setMark: "O")
        }
        //column
        if !moved {
            moved = checkTwoInARow(check1: 0, check2: 3, check3: 6, checkMark: "X", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 1, check2: 4, check3: 7, checkMark: "X", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 2, check2: 5, check3: 8, checkMark: "X", setMark: "O")
        }
        //diagonal
        if !moved {
            moved = checkTwoInARow(check1: 0, check2: 4, check3: 8, checkMark: "X", setMark: "O")
        }
        if !moved {
            moved = checkTwoInARow(check1: 2, check2: 4, check3: 6, checkMark: "X", setMark: "O")
        }
        return moved
    }
    
    func checkCenter() -> Bool {
        var moved = false
        if board[4] == "-" {
            setMove(number: 4, mark: "O")
            moved = true
        }
        return moved
    }
    
    func checkOppositeCorner() -> Bool {
        var moved = false
        if board[0] == "X" && board[8] == "-" {
            setMove(number: 8, mark: "O")
            moved = true
        } else if board[8] == "X" && board[0] == "-" {
            setMove(number: 0, mark: "O")
            moved = true
        } else if board[2] == "X" && board[6] == "-" {
            setMove(number: 6, mark: "O")
            moved = true
        } else if board[6] == "X" && board[2] == "-" {
            setMove(number: 2, mark: "O")
            moved = true
        }
        return moved
    }
    
    func checkEmptyCorner() -> Bool {
        var moved = false
        if board[0] == "-" {
            setMove(number: 0, mark: "O")
            moved = true
        } else if board[2] == "-" {
            setMove(number: 2, mark: "O")
            moved = true
        } else if board[6] == "-" {
            setMove(number: 6, mark: "O")
            moved = true
        } else if board[8] == "-" {
            setMove(number: 8, mark: "O")
            moved = true
        }
        return moved
    }
    
    func setFirstEmptyPosition() {
        var moved = false
        for index in 0...8 {
            if !moved && board[index] == "-" {
                setMove(number: index, mark: "O")
                moved = true
            }
        }
    }
    
    func makeMove() {
        if !checkGameOver() {
            if !checkWin() {
                if !checkBlock() {
                    if !checkCenter() {
                        if !checkOppositeCorner() {
                            if !checkEmptyCorner() {
                                setFirstEmptyPosition()
                            }
                        }
                    }
                }
            }
            if !checkGameOver() {
                userTurn = true
            }
        }
    }
    
}
