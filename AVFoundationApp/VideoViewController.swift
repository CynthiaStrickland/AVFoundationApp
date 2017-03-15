//
//  VideoViewController.swift
//  AVFoundationApp
//
//  Created by Cynthia Strickland on 3/13/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import AVFoundation
import CoreMedia

class VideoViewController: UIViewController {
    
    let buttonBorder = UIColor.white.cgColor
    let buttonColor = UIColor(red: 255/255, green:0/255, blue: 0/255, alpha: 0.5).cgColor
    
    @IBOutlet weak var previewView:UIView!
    @IBOutlet weak var recordButton:UIButton!
    @IBOutlet weak var toggleButton:UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.tintColor = .black
        
        customButtons()
    }
    
    func customButtons() {
        
        recordButton.layer.borderColor = buttonBorder
        recordButton.layer.borderWidth = 1
        recordButton.layer.cornerRadius = 10
        
        toggleButton.layer.borderColor = buttonBorder
        toggleButton.layer.backgroundColor  = buttonColor
        toggleButton.layer.borderWidth = 1
        toggleButton.layer.cornerRadius = 10
        
    }
    
    @IBAction func recordVideoButtonPressed(sender:AnyObject) {
        
    }
    
    @IBAction func cameraTogglePressed(sender:AnyObject) {

    }
}


