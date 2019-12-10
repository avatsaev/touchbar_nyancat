//
//  NyanCatCanvas.swift
//  touchbar_nyancat
//
//  Created by Aslan Vatsaev on 05/11/2016.
//  Copyright © 2016 AVatsaev. All rights reserved.
//

import Cocoa

class NyanCatCanvas: NSImageView {
    @objc var timer:Timer? = nil

    @objc var imageLoaded:Bool = false;

    @objc var xPosition: CGFloat = -680 {
        didSet {
            self.frame = CGRect(x: xPosition, y: 0, width: 680, height: 30)
        }
    }

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
        
        self.animates = true
        
        if(self.timer == nil) {
            timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.moveNyancat), userInfo: nil, repeats: true)
        }

        if(!self.imageLoaded){
            self.downloadImage()
        }
        
        self.canDrawSubviewsIntoLayer = true
//        self.frame = CGRect(x: xPosition, y: 0, width: 680, height: 30)
    }
    
    override func touchesBegan(with event: NSEvent) {
        // Calling super causes the cat to jump back to its original position 🤔
        //super.touchesBegan(with: event)
    }
    
    override func didAddSubview(_ subview: NSView) {
        
    }
    
    var direction: CGFloat = 1
    @objc public func moveNyancat() {
        xPosition += direction
        if xPosition > 0 {
            direction = -1
        } else if xPosition < -680 {
            direction = 1
        }
    }

    @objc func downloadImage() {
        
        let url = URL(string: "https://i.imgur.com/7pgdK28.gif")

        getDataFromUrl(url: url!) { (data, response, error)  in
            guard let data = data, error == nil else { return }

            DispatchQueue.main.async() { () -> Void in
                self.image = NSImage(data: data)
                self.imageLoaded = true;
            }
        }
    }
    
    @objc func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _  response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    

    
    override func touchesMoved(with event: NSEvent) {
        if #available(OSX 10.12.2, *) {
            let current = event.allTouches().first?.location(in: self).x ?? 0
            let previous = event.allTouches().first?.previousLocation(in: self).x ?? 0
        
            let dX = (current - previous)
            
            xPosition += dX
        } else {
            // Fallback on earlier versions
        }
    }
    
}
