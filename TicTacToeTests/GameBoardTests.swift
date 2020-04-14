//
//  GameBoardTests.swift
//  TicTacToeTests
//
//  Created by Gerardo Hernandez on 4/13/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import XCTest
@testable import TicTacToe

class GameBoardTests: XCTestCase {

   
    func testCreatingEmptyBoard() {
        let board = GameBoard()
        
//        if board[(x: 0, y: 0)] == nil {
            //Great
        
        // Check the first row
        XCTAssertNil(board[(x: 0, y: 0)])
        XCTAssertNil(board[(x: 1, y: 0)])
        XCTAssertNil(board[(x: 2, y: 0)])
        
        // Check the middle row
        XCTAssertNil(board[(x: 0, y: 1)])
        XCTAssertNil(board[(x: 1, y: 1)])
        XCTAssertNil(board[(x: 2, y: 1)])
        
        // Check the last row
        XCTAssertNil(board[(x: 0, y: 2)])
        XCTAssertNil(board[(x: 1, y: 2)])
        XCTAssertNil(board[(x: 2, y: 2)])
        
        for y in 0...2 {
            for x in 0...2 {
                XCTAssertNil(board[(x, y)], "The entry at (\(x), \(y)) was \(board[(x, y)]!) instead of nil:(.")
            }
        }
        
    }


}
