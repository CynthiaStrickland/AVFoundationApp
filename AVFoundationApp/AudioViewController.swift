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

    @IBOutlet weak var recordButton:UIButton!
    @IBOutlet weak var playButton:UIButton!
    
    // 1
    var audioRecorder:AVAudioRecorder!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //4
        self.prepareAudioRecorder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // 6
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
    
    // 3
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
    
    // 2
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
    
    //5
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