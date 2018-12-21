//
//  Game.swift
//  Nim
//
//  Created by Admin on 20/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import Foundation

class Game {
    
    static let START_MATCHES_COUNT: Int = 4
    
    var matchesCount = Game.START_MATCHES_COUNT
    let player1:String
    let player2:String
    var currentPlayer:String
    var previousPlayer:String = ""
    
    init(name1:String, name2:String) {
        player1 = name1
        player2 = name2
        currentPlayer = player1
    }
    
    func restartGame() {
        matchesCount = Game.START_MATCHES_COUNT
        currentPlayer = player1
        previousPlayer = ""
    }
    
    func getCurrentPlayer() -> String {
        return currentPlayer
    }
    
    func getPreviousPlayer() -> String {
        return previousPlayer
    }
    
    func getMatchesCount() -> Int {
        return matchesCount
    }
    
    func pickMatches(removedMatchesCount:Int) -> Bool {
        var res:Bool = false
        
        if removedMatchesCount >= 1
            && removedMatchesCount <= 3
            && removedMatchesCount <= matchesCount
        {
            matchesCount = matchesCount - removedMatchesCount
            res = true
        }
        
        return res
    }
    
    func changePlayer() {
        previousPlayer = currentPlayer
        if (currentPlayer == player1) {
            currentPlayer = player2
        } else {
            currentPlayer = player1
        }
    }
    
    func isGameOver() -> Bool {
        return matchesCount == 0
    }
}
