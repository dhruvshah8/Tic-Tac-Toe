//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Harshil Patel on 3/11/19.
//  Copyright © 2019 Harshil Patel. All rights reserved.
//

import UIKit

@available(iOS 10.3, *)
class ViewController: UIViewController {


    var activePlayer = 1 // For player
    
    var img1 = UIImage(named: "New X.png")                            // Declaring symbol for player 1
    var img2 = UIImage(named: "New O.png")                           //  Declaring symbol for player 2
    
    
    
    var grid = [0,0,0,0,0,0,0,0,0]                                   // All buttons
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8],                   // Horizontal Combinations
                              
                              [0, 3, 6], [1, 4, 7], [2, 5, 8],                  // Vertical Combinations
        
                                [2, 4, 6], [0, 4, 8]                           // Cross Combinations
                            
                              ]
    
    var gameStatus = true
    
    @IBOutlet weak var winningLabel: UILabel!
    
    @IBAction func actionCalled(_ sender: AnyObject)
    {
        if (grid[sender.tag-1] == 0 && gameStatus == true) {
            
            grid[sender.tag-1] = activePlayer
            
            if activePlayer == 1 {
                (sender as AnyObject).setImage(img1, for: .normal)
                activePlayer = 2                                    // Game turn change it to opposite
            } else {
                (sender as AnyObject).setImage(img2, for: .normal)
                activePlayer = 1                                   // Game turn change it to opposite
            }
            
            for combination in winningCombinations {
                
                if grid[combination[0]] != 0 && grid[combination[0]] == grid[combination[1]] && grid[combination[1]] == grid[combination[2]]
                {
                    gameStatus = false                            // When someone win the game it will stop the game
                    
                    if grid[combination[0]] == 1 {
                        winningLabel.text = "X Wins!"
                    } else {
                        winningLabel.text = "O Wins!"
                    }
                    
                    AppStoreReviewManager.requestReviewIfAppropriate()  //This will pop-up the review prompt after the condition check 
                    
                    restartButton.isHidden = false
                    
                    winningLabel.isHidden = false
                    
                    homeButton.isHidden = true
                    
                }
                
            }
            
        }
        
        
        var count = 1
        
        if gameStatus == true{
            for i in grid{
                count = i*count
            }
            if count != 0
            {
                winningLabel.text = "It's a tie, play again!"
                winningLabel.isHidden = false
                restartButton.isHidden = false
                 homeButton.isHidden = true
            }
        }

    }
    
    //Haptic feedback for Start Button
    
    @IBAction func startButton(_ sender: Any) {
     let generator = UIImpactFeedbackGenerator (style: .heavy)
        generator.impactOccurred()
    }
    
    
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    @IBAction func restartButton(_ sender: Any)                     // Everything will be disappeared and game will start from the top!
    {
     grid = [0,0,0,0,0,0,0,0,0]
    
     gameStatus = true
        
     activePlayer = 1
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
            
            restartButton.isHidden = true                     // Restart button will disappear
            
            winningLabel.isHidden = true                      // Winning label will disappear
            
            homeButton.isHidden = false                      // After pressing the restart button home button will appear
            
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        }
    
    
}

