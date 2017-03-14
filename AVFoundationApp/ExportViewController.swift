//
//  ExportViewController.swift
//  AVFoundationApp
//
//  Created by Cynthia Strickland on 3/13/17.
//  Copyright © 2017 Fenix Designz. All rights reserved.
//

import UIKit
import AVFoundation
import Photos

class ExportViewController: UIViewController, MediaCollectionDelegateProtocol {
    
    @IBOutlet weak var exportButton:UIButton!
    
    var assets = [PHAsset]()
    var fileUrl:URL?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func selectButtonPressed(sender:AnyObject) {
        
    }
    
    @IBAction func exportButtonPressed(sender:AnyObject) {
        
    }
    
    func mediaSelected(selectedAssets:[String:PHAsset]){
        
    }
    
    
    
    func fileName() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyhhmmss"
        return formatter.string(from: Date()) + ".mp4"
    }
    
    func presentShareViewForFileAtUrl(url:URL) {
        let controller = UIActivityViewController.init(activityItems: [url],
                                                       applicationActivities: nil)
        self.present(controller, animated: true, completion: nil)
    }
    
    
    func fetchAsset(){
        PhotoManager().fetchAssetsFromLibrary { (success, assets) in
            if success {
                self.assets = assets!
                self.performSegue(withIdentifier: "mediaPicker", sender: nil)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "mediaPicker" {
            let picker = segue.destination as! MediaCollectionViewController
            picker.delegate = self
            picker.assets = self.assets
        }
    }
}
