//
//  ViewController.swift
//  RtspClient
//
//  Created by Teocci on 18/05/16.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var video: RTSPPlayer!
    
    let url = "rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        video = RTSPPlayer(video: url, usesTcp: true)
        video.outputWidth = Int32(view.bounds.width)
        video.outputHeight = Int32(view.bounds.height)
        video.seekTime(0.0)
        
        
      let timer = Timer.scheduledTimer(timeInterval: 1.0/30, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
        timer.fire()
    }
    
  @objc func update(timer: Timer) {
        if(!video.stepFrame()){
            timer.invalidate()
            video.closeAudio()
        }
        imageView.image = video.currentImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

