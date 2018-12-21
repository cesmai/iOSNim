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
    @IBOutlet var ui_machesButtonList: [UIButton]!
    @IBOutlet weak var ui_matchesButtonStackView: UIStackView!
    
    static let START_MATCHES_TO_PICK_COUNT: Int = 1
    var game:Game?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
        ui_matchesButtonStackView.isHidden = false
    }
    
    
    func updateGameUI() {
        
        if let safeGame: Game = game {
            ui_playerNameLabel.text = safeGame.getCurrentPlayer()
            ui_matchesRemainingLabel.text = String(safeGame.getMatchesCount())
            ui_nbMatchesWillTakeLabel.text = String(GameViewController.START_MATCHES_TO_PICK_COUNT)
            ui_nbMatchesWillTakeStepper.value = Double(GameViewController.START_MATCHES_TO_PICK_COUNT)
            
            if safeGame.getMatchesCount() < 3 {
                ui_machesButtonList[2].isHidden = true
            }
            if safeGame.getMatchesCount() < 2 {
                ui_machesButtonList[1].isHidden = true
            }
        }
    }
    
    @IBAction func nbMatchesValueChanged(_ sender: Any) {
        ui_nbMatchesWillTakeLabel.text = String(Int(ui_nbMatchesWillTakeStepper.value))
    }
    
    
    @IBAction func nextButtonTouched() {
        
        let matchesSelectedByPlayerCount = Int(ui_nbMatchesWillTakeStepper.value)
        playerWillPlay(matchesPicked: matchesSelectedByPlayerCount)
    }
    
    
    func playerWillPlay(matchesPicked: Int) {
        
        if let safeGame: Game = game {
            let pickSucceed:Bool = safeGame.pickMatches(removedMatchesCount: matchesPicked)
            
            if (safeGame.isGameOver()) {
                
                // Hide all matches button
//                for matchButton in ui_machesButtonList {
//                    matchButton.isHidden = true
//                }
                ui_matchesButtonStackView.isHidden = true
                
                // Display a ending message
                ui_congratsWinnerLabel.text = "Congratulations \(safeGame.getPreviousPlayer()) : you WON !!!"
                ui_congratsWinnerLabel.isHidden = false
                
                // Replace Next button by Restart one
                ui_restartButton.isHidden = false
                ui_nextPlayerButton.isHidden = true
            } else {
                if pickSucceed {
                    changePlayer()
                }
            }
        }
    }
    
    
    @IBAction func matchesButtonTouched(_ sender: UIButton) {
        
        let matchesSelectedByPlayerCount = sender.tag
        playerWillPlay(matchesPicked: matchesSelectedByPlayerCount)
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
