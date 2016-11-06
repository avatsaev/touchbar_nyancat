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
  
  //NOTE: I fucking love Swift's computed properties!
  var sound: Bool = true {
    
    didSet{
      
      if sound {
        audio_player?.play()
        sound_btn.image = sound_btn_image_on
      }else{
        audio_player?.pause()
        sound_btn.image = sound_btn_image_off
      }

    }
    
  }
  
  var sound_btn_title: String?
  var sound_btn_image_on: NSImage?
  var sound_btn_image_off: NSImage?
  
  
  @IBOutlet weak var sound_btn: NSButtonCell!
  @IBOutlet weak var bkg: NSView!

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.wantsLayer = true
    
  }
  
  
  @IBAction func toggle_sound(_ sender: Any) {
    
    //NOTE: Swift's computed properties FTW!
    sound = !sound
  }
  
  override func viewWillAppear() {
    
    bkg.layer?.backgroundColor = NSColor(red:0.08, green:0.31, blue:0.55, alpha:1.00).cgColor
    
    sound_btn_image_on = NSImage(named: "ic_volume_up_3x.png")
    sound_btn_image_off = NSImage(named: "ic_volume_off_3x.png")

    
    let nyan_music = URL(fileURLWithPath: Bundle.main.path(forResource: "nyan_music", ofType: "mp3")!)
    
    do {
      
      try audio_player = AVAudioPlayer(contentsOf: nyan_music)
      audio_player?.numberOfLoops = -1
      audio_player?.prepareToPlay()
      
    }catch{}
    
    sound = true


  }

  override var representedObject: Any? {
    didSet {
    // Update the view, if already loaded.
    }
  }

}

