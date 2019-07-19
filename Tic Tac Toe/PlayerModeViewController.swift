//
//  PlayerModeViewController.swift
//  Tic Tac Toe
//
//  Created by Harshil Patel on 4/10/19.
//  Copyright © 2019 Harshil Patel. All rights reserved.
//

import UIKit

import AVFoundation

class PlayerModeViewController: UIViewController {
    
      var audioPlayer: AVAudioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var aiMode: UIButton!
    
    @IBOutlet weak var twoPlayerMode: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            audioPlayer = try AVAudioPlayer(contentsOf:URL.init(fileURLWithPath: Bundle.main.path(forResource: "GameBG", ofType: "mp3")!))
            
            audioPlayer.prepareToPlay()
            
            audioPlayer.numberOfLoops = -1
            
            audioPlayer.play()
            
            
        }
        catch {
            print(error)
        }
    }
    
    

     @IBAction func takeToPlayMode (_ sender: UIStoryboardSegue) {}
    
}
