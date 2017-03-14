//
//  VideoPreviewViewController.swift
//  AVFoundationApp
//
//  Created by Cynthia Strickland on 3/13/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoPreviewViewController: UIViewController {
    
    @IBOutlet weak var playerView:PlayerView!
    @IBOutlet weak var saveButton:UIButton!
    @IBOutlet weak var playPauseButton:UIButton!
    @IBOutlet weak var stopButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closePreview() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveToLibrary() {
    }
    
    @IBAction func playPauseButtonPressed() {
    }
    
    func showAlert(title:String, message:String, dismiss:Bool) {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        if dismiss {
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.dismiss(animated: true, completion: nil)
            }))
        } else {
            controller.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        
        self.present(controller, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}