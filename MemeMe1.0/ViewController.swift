//
//  ViewController.swift
//  MemeMe1.0
//
//  Created by Francisco on 1/9/20.
//  Copyright © 2020 Francisco. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    //set both textfields
        
    
    }

    @IBAction func albumLoadingAction(_ sender: Any) {
        
    let albumController = UIImagePickerController()
    present(albumController, animated: true, completion: nil)
    }
    
    @IBAction func cameraLoadingAction(_ sender: Any) {
        
    let cameraController = UIImagePickerController()
        cameraController.delegate = self
        cameraController.sourceType = .camera
    present(cameraController, animated: true, completion: nil)
    //needs to implement boolean for when camera is not available
    }
    
    @IBAction func TopTextFieldAction(_ sender: Any) {
    }
    
    
    @IBAction func BottomTextFieldAction(_ sender: Any) {
    }
    
    @IBAction func CancelAction(_ sender: Any) {
    }
    
    @IBAction func ShareAction(_ sender: Any) {
    }
    
}

