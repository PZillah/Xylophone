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
    
    var player: AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


    @IBAction func keyPressed(_ sender: UIButton) {
        
        playSound()
    }
    
    func playSound() {
        //1. grabbing the sound file from resources
        guard let url = Bundle.main.url(forResource: "C", withExtension: "wav") else { return }
        
        //2. then it's making sure the sound gets played while phone is on silent
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            //3. then we tell audio player which file to play
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            guard let player = player else { return }
            
            //4. then we actually play it
            player.play()

            //if there are any errors, we catch them and print them out
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

