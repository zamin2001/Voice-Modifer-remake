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
        
   
       let synthesizer1 = AVSpeechSynthesizer()
       let synthesizer2 = AVSpeechSynthesizer()
      let synthesizer3 = AVSpeechSynthesizer()
        let accent1 = AVSpeechUtterance(string: "Darf ich mal vorbei?")
        let accent2 = AVSpeechUtterance(string: "Hallo!")
         let accent3 = AVSpeechUtterance(string: "Guten Morgen!")
        accent1.voice = AVSpeechSynthesisVoice(language: "de-DE")
        accent2.voice = AVSpeechSynthesisVoice(language: "de-DE")
        accent3.voice = AVSpeechSynthesisVoice(language: "de-DE")
        accent1.rate = 0.4
        accent2.rate = 0.4
        accent3.rate = 0.4
        synthesizer1.speak(accent1)
         synthesizer2.speak(accent2)
        synthesizer3.speak(accent3)
        
        
    }
    
    @IBAction func EnglishPhrases(_ sender: UIButton) {
        
       let synthesizer1 = AVSpeechSynthesizer()
        let synthesizer2 = AVSpeechSynthesizer()
        let synthesizer3 = AVSpeechSynthesizer()
        

       let accent1 = AVSpeechUtterance(string: "How are doing today mate?")
         let accent2 = AVSpeechUtterance(string: "cheers mate")
        let accent3 = AVSpeechUtterance(string: "Not my cuppa tea")
       
        accent1.voice = AVSpeechSynthesisVoice.init(language:"en-GB")
        accent2.voice = AVSpeechSynthesisVoice.init(language:"en-GB")
       accent3.voice = AVSpeechSynthesisVoice.init(language:"en-GB")
        accent1.rate = 0.4
        accent2.rate = 0.4
        accent3.rate = 0.4
        synthesizer1.speak(accent1)
        synthesizer2.speak(accent2)
        synthesizer3.speak(accent3)
    }
    
    
    @IBAction func SpanishPhrases(_ sender: UIButton) {
        let synthesizer1 = AVSpeechSynthesizer()
         let synthesizer2 = AVSpeechSynthesizer()
         let synthesizer3 = AVSpeechSynthesizer()
        
        let accent1 = AVSpeechUtterance(string: "Hola como estas, me llamo elizabeth")
        let accent2 = AVSpeechUtterance(string: "¡Buenos días, Estela!")
        let accent3 = AVSpeechUtterance(string: "Que tale mi amigo")
        
        accent1.voice = AVSpeechSynthesisVoice(language: "es-ES")
          accent2.voice = AVSpeechSynthesisVoice(language: "es-ES")
        accent3.voice = AVSpeechSynthesisVoice(language: "es-ES")
        accent1.rate = 0.4
        accent2.rate = 0.4
        accent3.rate = 0.4
        synthesizer1.speak(accent1)
        synthesizer2.speak(accent2)
        synthesizer3.speak(accent3)
    }
    
}
