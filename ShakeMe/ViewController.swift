//
//  ViewController.swift
//  ShakeMe
//
//  Created by Bhagat Singh on 6/16/17.
//  Copyright © 2017 com.bhagat_singh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        do{
            let url = Bundle.main.url(forResource: "batman_on_drugs", withExtension: "mp3")!
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer.prepareToPlay()
        }catch{
            print("Audio Error \(error)")
        }
        
        webView.isHidden = true
        let url = Bundle.main.url(forResource: "batman", withExtension: "gif")!
        let data = try! Data(contentsOf: url)
        webView.load(data, mimeType: "image/gif", textEncodingName: "UTF-8", baseURL: NSURL() as URL)
        webView.scalesPageToFit = true
        webView.contentMode = UIViewContentMode.scaleAspectFit
    }

    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            webView.isHidden = false
            audioPlayer.play()
            print("Started")
        }
    }

    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        if motion == .motionShake{
            webView.isHidden = true
            audioPlayer.pause()
            
            print("Ended")
        }
    }
}
