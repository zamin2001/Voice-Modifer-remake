//
//  ViewController.swift
//  Voice Modifer remake
//
//  Created by zamin ahmed on 5/7/19.
//  Copyright © 2019 zamin ahmed. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var AudioRecorder:AVAudioRecorder?
    var AudioPlayer:AVAudioPlayer?
    
    let filename = "sound.caf"
    
    @IBOutlet weak var StopButton: UIButton!
    
    @IBOutlet weak var PlayButton: UIButton!
    
    @IBOutlet weak var RecordButton: UIButton!
    
    
    ///This action is connected to our stop button on the first view controller. It disables the other buttons,play and Record Button, since a recording has already occured. Additionally, it notifies the user via alert view that there recording has been successful
    @IBAction func StopAudio(_ sender: UIButton) {
        StopButton.isEnabled = false
        PlayButton.isEnabled = true
        RecordButton.isEnabled = true
        
        if AudioRecorder?.isRecording == true {
            AudioRecorder?.stop()
        } else {
            AudioRecorder?.stop()
        }
        displayDoneMessage(message: "Done")
       
    }

    @IBAction func RecordAudio(_ sender: UIButton) {
        if AudioRecorder?.isRecording == false {
            PlayButton.isEnabled = false
            StopButton.isEnabled = true
            AudioRecorder?.record()
        }
    }
    
    ///When we play the audio we disable the recod button if the audio recorder is not recording. Then we create the audio recording as a Url using the do try statement and prepare it for playing. Finally we have a catch statment in case the audio doesn't play back
    @IBAction func PlayAudio(_ sender: UIButton) {
        if AudioRecorder?.isRecording == false {
            StopButton.isEnabled = true
            RecordButton.isEnabled = false
            
            do {
                try AudioPlayer = AVAudioPlayer(contentsOf:(AudioRecorder?.url)!)
                AudioPlayer!.delegate = self
                AudioPlayer!.prepareToPlay()
                AudioPlayer!.play()
            } catch let error as NSError {
                print("audioPlayer error: \(error.localizedDescription)")
            }
        }
        
    }
    
    ///In the viewdidLoad we disable the Playbutton and StopButton as well as create  the url file for our recording as well as designate where those files will be stored and where the audio recording settings will be/
    override func viewDidLoad() {
        super.viewDidLoad()
        PlayButton.isEnabled = false
        StopButton.isEnabled = false
        
        let fileMgr = FileManager.default
        
        let dirPaths = fileMgr.urls(for: .documentDirectory,in: .userDomainMask)
        
        let soundFileURL = dirPaths[0].appendingPathComponent("sound.caf")
        
        let recordSettings =
            [AVEncoderAudioQualityKey: AVAudioQuality.min.rawValue,
             AVEncoderBitRateKey: 16,
             AVNumberOfChannelsKey: 2,
             AVSampleRateKey: 44100.0] as [String : Any]
        
        let audioSession = AVAudioSession.sharedInstance()
        
        // This do statement try's the audio session that we have created and also includes a catch statement that allows us to catch any errors we ahve
        do {
            try audioSession.setCategory(
                AVAudioSession.Category.playAndRecord)
        }
        catch let error as NSError {
            print("audioSession error: \(error.localizedDescription)")
     }
        
        //This second try statment tests the audio recorder with the recording session that we have created earlier if it fails we catch the error
        do {
            try AudioRecorder =  AVAudioRecorder(url: soundFileURL,settings: recordSettings as [String: AnyObject])
            AudioRecorder?.prepareToRecord()
        }
        catch let error as NSError {
            print("audioSession error: \(error.localizedDescription)")
            
        }
    }
    
    //This function returns if the audioplayer has finished playing
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        RecordButton.isEnabled = true
        StopButton.isEnabled = false
    }
 
    func audioPlayerErrorOccured(_ player: AVAudioPlayer, error: Error?){
        print("Audio Play Decode Error")
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        RecordButton.isEnabled = false
        StopButton.isEnabled = true
        PlayButton.isEnabled = true
    }
    
    
    func audioRecorderEncodeErrorDidOccur(_ recorder: AVAudioRecorder, error: Error?) {
        print("Audio Record Encode Error")
    }
    
    //This method creates structures for our  UI alert view.
    func displayDoneMessage(message:String) {
        let alert = UIAlertController(title: message, message: nil, preferredStyle: .alert)
        let alertAction = UIAlertAction(title:"Recording complete", style:.default) { (action) in
        }
        alert.addAction(alertAction)
        present(alert,animated:true,completion: nil)
        
    }
}







