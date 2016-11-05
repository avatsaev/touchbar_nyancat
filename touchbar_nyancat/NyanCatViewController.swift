//
//  ViewController.swift
//  touchbar_nyancat
//
//  Created by Aslan Vatsaev on 05/11/2016.
//  Copyright © 2016 AVatsaev. All rights reserved.
//

import Cocoa
import AVFoundation



class NyanCatViewController: NSViewController , NSTouchBarDelegate{
  
  var audio_player: AVAudioPlayer?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
      let nyan_music = URL(fileURLWithPath: Bundle.main.path(forResource: "nyan_music", ofType: "mp3")!)
    
      do {
        
        try audio_player = AVAudioPlayer(contentsOf: nyan_music)
        audio_player?.numberOfLoops = -1
        audio_player?.prepareToPlay()
      
        audio_player?.play()
        
      }catch{}
    
    
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

