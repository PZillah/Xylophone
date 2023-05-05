//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//
import UIKit
import AVFoundation //audio visual foundational module
// these modules are libraries of code by apple to allow us to interact with diff parts of hardware and to perform diff tasks

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound()
        
        print(sender.currentTitle)
        print(sender.titleLabel?.text)
    }
    //1. grabbing the sound file from resources
    //2. then we tell audio player which file to play
    //3. then we actually play it
    func playSound() {
        let url = Bundle.main.url(forResource: "C", withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

