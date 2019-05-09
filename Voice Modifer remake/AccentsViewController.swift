//
//  AccentsViewController.swift
//  Voice Modifer remake
//
//  Created by zamin ahmed on 5/8/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit
import AVFoundation
class AccentsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    
    @IBAction func GermanPhrases(_ sender: Any) {
        let synthesizer = AVSpeechSynthesizer()
        var accent = AVSpeechUtterance(string: "")
        var dialogue = ["Hello Chap","Man I was buzzin at the bar after drinks", "Man it chucking down today, looks like no futbol","I’m gutted, man, I didn’t even have the chance to get her phone number.", ]
        accent.voice = AVSpeechSynthesisVoice(language: "en-GB-Daniel")
        accent = AVSpeechUtterance(string: dialogue.randomElement()!)
        accent.rate = 0.4
        synthesizer.speak(accent)
    }
    
    @IBAction func EnglishPhrases(_ sender: UIButton) {
        let synthesizer = AVSpeechSynthesizer()
        var accent = AVSpeechUtterance(string: "")
        var dialogue = ["Hello Chap","Man I was buzzin at the bar after drinks", "Man it chucking down today, looks like no futbol","I’m gutted, man, I didn’t even have the chance to get her phone number.", ]
        accent.voice = AVSpeechSynthesisVoice(language: "en-GB-Daniel")
        accent = AVSpeechUtterance(string: dialogue.randomElement()!)
        accent.rate = 0.4
        synthesizer.speak(accent)

    }
    
    
    @IBAction func SpanishPhrases(_ sender: UIButton) {
    }
    
}
