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
  
  
  @IBOutlet weak var bkg: NSView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    
      self.view.wantsLayer = true
    
      let nyan_music = URL(fileURLWithPath: Bundle.main.path(forResource: "nyan_music", ofType: "mp3")!)
    
      do {

        try audio_player = AVAudioPlayer(contentsOf: nyan_music)
        audio_player?.numberOfLoops = -1
        audio_player?.prepareToPlay()
      
        audio_player?.play()
        
      }catch{}
    
    
  }
  
  override func viewWillAppear() {
    bkg.layer?.backgroundColor = NSColor(red:0.08, green:0.31, blue:0.55, alpha:1.00).cgColor
  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

