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

    @IBOutlet weak var topTextFieldOutlet: UITextField!
    @IBOutlet weak var bottomTextFieldOutlet: UITextField!
    @IBOutlet weak var cameraButton: UITextField!
    @IBOutlet weak var albumButton: UIBarButtonItem!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //set both textfields
    topTextFieldOutlet.text = "TOP"
    topTextFieldOutlet.textAlignment = .center
    bottomTextFieldOutlet.text = "BOTTOM"
    bottomTextFieldOutlet.textAlignment = .center
    
    }

    @IBAction func albumLoadingAction(_ sender: Any) {
        
    let albumController = UIImagePickerController()
    albumController.delegate = self
    albumController.sourceType = .photoLibrary
    present(albumController, animated: true, completion: nil)
    }
    
    @IBAction func cameraLoadingAction(_ sender: Any) {
    
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let alertController = UIAlertController.init(title: nil, message: "Device has no camera.", preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: "Alright", style: .default, handler: {(alert: UIAlertAction!) in
            })
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else{
            let cameraController = UIImagePickerController()
            cameraController.delegate = self
            cameraController.sourceType = .camera
            present(cameraController, animated: true, completion: nil)
        }
        
  
    }
    
    //    cameraController.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    
    override func viewWillAppear(_ animated: Bool) {
        //code to check if device has available camera
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
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

