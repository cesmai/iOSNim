//
//  NimTests.swift
//  NimTests
//
//  Created by Admin on 21/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import XCTest
@testable import Nim

class GameTests: XCTestCase {
    
    var game:Game = Game(name1: "Player 1", name2: "Player 2")

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGameStartWithPlayer1() {
        XCTAssertEqual("Player 1", game.currentPlayer)
    }
    
    func testGameIsOverWhenPlayersPickedAllMatches() {
        game.matchesCount = 1
        let succeedToPickOneMatch = game.pickMatches(removedMatchesCount: 1)
        XCTAssertTrue(succeedToPickOneMatch, "Should succeed to pick one match")
        XCTAssertTrue(game.isGameOver(), "Game should be over")
    }

}
