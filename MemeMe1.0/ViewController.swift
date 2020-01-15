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
    @IBOutlet weak var imageView: UIImageView!
    
    
    let selectImageController = UIImagePickerController()
    
    override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //set both textfields
    topTextFieldOutlet.defaultTextAttributes = memeTextAttributes
    topTextFieldOutlet.textAlignment = .center
        
    bottomTextFieldOutlet.defaultTextAttributes = memeTextAttributes
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
        //code to check if device has available camera
        
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }
    
    let memeTextAttributes: [NSAttributedString.Key: Any] = [
        NSAttributedString.Key.strokeColor: UIColor.black,
        NSAttributedString.Key.foregroundColor: UIColor.white,
        NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
        NSAttributedString.Key.strokeWidth:  -5.0
        
    ]
    
    @IBAction func TopTextFieldAction(_ sender: Any) {
    }
    
    
    @IBAction func BottomTextFieldAction(_ sender: Any) {
    }
    
    @IBAction func CancelAction(_ sender: Any) {
    }
    
    @IBAction func ShareAction(_ sender: Any) {
    }
    
    //Selecting the image
    func selectImage(sourceType: UIImagePickerController.SourceType){
     
        selectImageController.delegate = self
        selectImageController.sourceType = sourceType
        present(selectImageController, animated: true, completion: nil)
        
    }
    //Receiving selected image manipulation
    
    func selectedImage(_picker: UIImagePickerController, didFinishMediawithInfo info: [UIImagePickerController.InfoKey:Any]){
        
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            imageView.contentMode = .scaleAspectFit
            
        }
    }
    
    
    
}

