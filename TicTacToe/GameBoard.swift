//
//  GameBoard.swift
//  TicTacToe
//
//  Created by Andrew R Madsen on 9/11/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import Foundation



struct GameBoard {
    

    
    enum Mark: Equatable {
        case x
        case o
        
        var stringValue: String {
            switch self {
            case .x: return "X"
            case .o: return "O"
            }
        }
    }
    
      private var squares = Array(repeating: Square.empty, count: 9)
        
    //    private var squares: [Square] = {
    //        var array = Array(repeating: Square.empty, count: 9)
    //        array[4] = .filled(.x)
    //        return array
    //    }()
    //
    
    private enum Square: Equatable {
        case filled(Mark)
        case empty
    }
    // let gameboard = Gameboard()
    // let mark = gameboard[(x:1, y:2)]
    //A subscript function allows me to access objects inside the board using squared brackets.
    //Whatever is the paramenter in this function will serve as the bracket's input.
    //
    //e.g board[(0,0)] -> Mark?
    subscript(coordinate: Coordinate) -> Mark? {
        let square = squares[arrayIndex(for: coordinate)]
        if case let Square.filled(mark) = square {
            return mark
        } else {
            return nil
        }
    }
    //
    mutating func place(mark: Mark, on square: Coordinate) throws {
        if self[square] != nil {
            throw GameBoardError.invalidSquare
        }
        // Find the index (0) from the given coordinate(0,0)
        //(0,0) -> Indez
        let indexFromCoordinate = arrayIndex(for: square)
        squares[arrayIndex(for: square)] = .filled(mark)
    }
    
    var isFull: Bool {
        for square in squares {
            if square == .empty {
                return false
            }
        }
        return true
    }
    
    private func arrayIndex(for square: Coordinate) -> Int {
        return square.y * 3 + square.x
    }
    
    enum Position {
        case topLeft
        case topCenter
        case topRight
        case middleLeft
        case middleCenter
        case middleRight
        case bottomLeft
        case bottomCenter
        case bottomRight
    }
    
}

enum GameBoardError: Error, Equatable {
    case invalidSquare
}

typealias Coordinate = (x: Int, y: Int)
