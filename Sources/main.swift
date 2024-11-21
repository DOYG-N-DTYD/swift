// The Swift Programming Language
// https://docs.swift.org/swift-book
//print("Hello, world!")

//import Foundation

enum Player {
    case x, o
}

class TicTacToe {
    var board: [[String]]
    var currentPlayer: Player
    var gameOver: Bool
    
    init() {
        board = Array(repeating: Array(repeating: " ", count: 3), count: 3)
        currentPlayer = .x
        gameOver = false
    }
    
    func printBoard() {
        for row in board {
            print(row.map { $0 == " " ? "-" : $0 }.joined(separator: " | "))
        }
    }
    
    func makeMove(row: Int, col: Int) {
        if row < 0 || row >= 3 || col < 0 || col >= 3 || board[row][col] != " " {
            print("Неверный ход! Попробуйте снова.")
            return
        }
        
        board[row][col] = currentPlayer == .x ? "X" : "O"
        
        if checkWin() {
            gameOver = true
            printBoard()
            print("\(currentPlayer == .x ? "X" : "O") выиграл!")
        } else if isBoardFull() {
            gameOver = true
            printBoard()
            print("Ничья!")
        } else {
            currentPlayer = currentPlayer == .x ? .o : .x
        }
    }
    
    func checkWin() -> Bool {
        // Проверка строк, столбцов и диагоналей
        for i in 0..<3 {
            if board[i][0] == board[i][1], board[i][1] == board[i][2], board[i][0] != " " {
                return true
            }
            if board[0][i] == board[1][i], board[1][i] == board[2][i], board[0][i] != " " {
                return true
            }
        }
        
        // Проверка диагоналей
        if board[0][0] == board[1][1], board[1][1] == board[2][2], board[0][0] != " " {
            return true
        }
        if board[0][2] == board[1][1], board[1][1] == board[2][0], board[0][2] != " " {
            return true
        }
        
        return false
    }
    
    func isBoardFull() -> Bool {
        for row in board {
            if row.contains(" ") {
                return false
            }
        }
        return true
    }
}

func startGame() {
    let game = TicTacToe()
    
    while !game.gameOver {
        game.printBoard()
        print("\(game.currentPlayer == .x ? "X" : "O") ход:")
        
        // Ввод координат хода
        if let input = readLine() {
            let parts = input.split(separator: " ")
            if parts.count == 2,
               let row = Int(parts[0]), let col = Int(parts[1]),
               row >= 0, row < 3, col >= 0, col < 3 {
                game.makeMove(row: row, col: col)
            } else {
                print("Некорректный ввод. Введите два числа от 0 до 2, разделённые пробелом.")
            }
        }
    }
}

startGame()
