//
//  NyanCatCanvas.swift
//  touchbar_nyancat
//
//  Created by Aslan Vatsaev on 05/11/2016.
//  Copyright © 2016 AVatsaev. All rights reserved.
//

import Cocoa

class NyanCatCanvas: NSImageView {

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
      
        self.frame = CGRect(x: 0, y: 0, width: 685, height: 30)
      
        self.animates = true
        self.image = NSImage(named: "nyan_long@2x.gif")!
        self.canDrawSubviewsIntoLayer = true
    }
    
}
