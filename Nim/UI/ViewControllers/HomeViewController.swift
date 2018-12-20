//
//  ViewController.swift
//  Nim
//
//  Created by Admin on 19/12/2018.
//  Copyright © 2018 Cecile M. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var ui_player1TextField: UITextField!
    @IBOutlet weak var ui_player2TextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let player1Str = ui_player1TextField.text,
            let player2Str = ui_player2TextField.text,
            let gameVC = segue.destination as? GameViewController
        {
            gameVC.game = Game(name1: player1Str, name2: player2Str)
        }
    }
    
}
