//
//  GameController.swift
//  Nim
//
//  Created by Admin on 19/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var ui_playerNameLabel: UILabel!
    @IBOutlet weak var ui_matchesRemainingLabel: UILabel!
    @IBOutlet weak var ui_nbMatchesWillTakeLabel: UILabel!
    @IBOutlet weak var ui_nbMatchesWillTakeStepper: UIStepper!
    @IBOutlet weak var ui_congratsWinnerLabel: UILabel!
    @IBOutlet weak var ui_restartButton: UIButton!
    @IBOutlet weak var ui_nextPlayerButton: UIButton!
    
    static let START_MATCHES_TO_PICK_COUNT: Int = 1
    var game:Game?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startGameUI()
    }
    
    func startGameUI() {
        initGameUI()
        updateGameUI()
    }
    
    
    func initGameUI() {
        
        ui_matchesRemainingLabel.text = String(Game.START_MATCHES_COUNT)
        ui_congratsWinnerLabel.isHidden = true
        ui_nextPlayerButton.isHidden = false
        ui_restartButton.isHidden = true
    }
    
    
    func updateGameUI() {
        
        if let safeGame: Game = game {
            ui_playerNameLabel.text = safeGame.getCurrentPlayer()
            ui_matchesRemainingLabel.text = String(safeGame.getMatchesCount())
            ui_nbMatchesWillTakeLabel.text = String(GameViewController.START_MATCHES_TO_PICK_COUNT)
            //TODO faire un setter car s'il ne reste plus que 2 allumettes, il ne faut pas lui proposer d'en prendre 3 ...
            ui_nbMatchesWillTakeStepper.value = Double(GameViewController.START_MATCHES_TO_PICK_COUNT)
        }
    }
    
    @IBAction func nbMatchesValueChanged(_ sender: Any) {
        ui_nbMatchesWillTakeLabel.text = String(Int(ui_nbMatchesWillTakeStepper.value))
    }
    
    
    @IBAction func nextButtonTouched() {
        
        if let safeGame: Game = game {
            let matchesSelectedByPlayerCount = ui_nbMatchesWillTakeStepper.value
            safeGame.pickMatches(removedMatchesCount: Int(matchesSelectedByPlayerCount))
            
            if (safeGame.isGameOver()) {
                // Display a ending message
                ui_congratsWinnerLabel.text = "Congratulations \(safeGame.getPreviousPlayer()) : you WON !!!"
                ui_congratsWinnerLabel.isHidden = false
                
                // Replace Next button by Restart one
                ui_restartButton.isHidden = false
                ui_nextPlayerButton.isHidden = true
            } else {
                changePlayer()
            }
        }
    }
    
    @IBAction func restartButtonTouched() {
        
        if let safeGame: Game = game {
            safeGame.restartGame()
            startGameUI()
        }
    }
    
    func changePlayer() {
        
        if let safeGame: Game = game {
            safeGame.changePlayer()
            updateGameUI()
        }
    }
    
}
