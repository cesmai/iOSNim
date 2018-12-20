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
    
    static let START_MATCHES_TO_PICK_COUNT: Int = 1
    var game:Game?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initGameUI()
        updateGameUI()
    }
    
    
    func initGameUI() {
        ui_matchesRemainingLabel.text = String(Game.START_MATCHES_COUNT)
    }
    
    
    func updateGameUI() {
        
        if let safeGame: Game = game {
            ui_playerNameLabel.text = safeGame.getCurrentPlayer()
            ui_matchesRemainingLabel.text = String(safeGame.getMatchesCount())
            ui_nbMatchesWillTakeLabel.text = String(GameViewController.START_MATCHES_TO_PICK_COUNT)
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
            viewChangePlayer()
        }
    }
    
    
    func viewChangePlayer() {
        
        if let safeGame: Game = game {
            safeGame.changePlayer()
            updateGameUI()
        }
    }
    
}
