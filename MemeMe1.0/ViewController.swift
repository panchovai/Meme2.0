//
//  ViewController.swift
//  MemeMe1.0
//
//  Created by Francisco on 1/9/20.
//  Copyright © 2020 Francisco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func AlbumLoadingAction(_ sender: Any) {
        
    let albumController = UIImagePickerController()
    present(albumController, animated: true, completion: nil)
    }
    
    
    
}

