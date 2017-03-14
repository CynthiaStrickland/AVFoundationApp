//
//  AudioViewController.swift
//  AVFoundationApp
//
//  Created by Cynthia Strickland on 3/13/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import AVFoundation

class AudioViewController: UIViewController {

    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 40/255, green: 141/255, blue: 255/255, alpha: 0.5).cgColor
    
    @IBOutlet weak var recordButton:UIButton!
    @IBOutlet weak var playButton:UIButton!
    
    var audioRecorder:AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        customButtons()
        
        self.prepareAudioRecorder()

    }

    func customButtons() {
        recordButton.layer.borderColor = buttonBorder
        recordButton.layer.backgroundColor  = buttonColor
        recordButton.layer.borderWidth = 1
        recordButton.layer.cornerRadius = 10
        
        playButton.layer.borderColor = buttonBorder
        playButton.layer.backgroundColor  = buttonColor
        playButton.layer.borderWidth = 1
        playButton.layer.cornerRadius = 10
    
    }

    @IBAction func recordButtonPressed(sender:AnyObject) {
        if !audioRecorder.isRecording {
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setActive(true)
                audioRecorder.record()
            } catch {
                print(error)
            }
        } else {
            audioRecorder.stop()
            let audioSession = AVAudioSession.sharedInstance()
            do {
                try audioSession.setActive(false)
            } catch {
                print(error)
            }
            
            // Check to see if audio file exists, if so present play button
            if self.verifyFileExists() {
                print("file exists")
                playButton.isHidden = false
            } else {
                print("There was a problem recording")
            }
        }
        
        self.updateRecordButtonTitle()
    }
    
    @IBAction func playButtonPressed(sender:AnyObject) {

    }

    func prepareAudioRecorder() {
        let audioSession = AVAudioSession.sharedInstance()
        
        do {
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
            try audioRecorder = AVAudioRecorder(url: URL(fileURLWithPath: self.audioFileLocation()), settings: self.audioRecorderSettings())
            audioRecorder.prepareToRecord()
        } catch {
            print(error)
        }
    }
    
    // MARK: Helpers
    func audioFileLocation() -> String {
        return NSTemporaryDirectory().appending("audioRecording.m4a")
    }
    
    func audioRecorderSettings() -> [String:Any] {
        let settings = [AVFormatIDKey : NSNumber.init(value: kAudioFormatAppleLossless),
                        AVSampleRateKey : NSNumber.init(value: 44100.0),
                        AVNumberOfChannelsKey : NSNumber.init(value: 1),
                        AVLinearPCMBitDepthKey: NSNumber.init(value: 16),
                        AVEncoderAudioQualityKey : NSNumber.init(value: AVAudioQuality.high.rawValue)]
        return settings
    }
    
    func updateRecordButtonTitle() {
        if audioRecorder.isRecording {
            recordButton.setTitle("Recording..", for: .normal)
        } else {
            recordButton.setTitle("Record", for: .normal)
        }
    }
    
    func verifyFileExists() -> Bool {
        let fileManager = FileManager.default
        
        return fileManager.fileExists(atPath: self.audioFileLocation())
    }
}
