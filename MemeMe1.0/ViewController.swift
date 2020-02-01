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
        
    imageView.contentMode = .scaleAspectFit
    
    }

    @IBAction func albumLoadingAction(_ sender: Any) {
        
   // selectImage(sourceType: .photoLibrary)
   let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary
        pickerController.allowsEditing = true
        present(pickerController, animated: true, completion: nil)
        
    
    }
    
    @IBAction func cameraLoadingAction(_ sender: Any) {
    
      choosePictureFromCameraSource(source: .camera)
        
  
    }
    
    func choosePictureFromCameraSource(source: UIImagePickerController.SourceType){
        
        if !UIImagePickerController.isSourceTypeAvailable(.camera){
            
            let alertController = UIAlertController.init(title: nil, message: "Device has no camera.", preferredStyle: .alert)
            
            let okAction = UIAlertAction.init(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in
            })
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
        else{
            let cameraController = UIImagePickerController()
            cameraController.delegate = self
            cameraController.sourceType = .camera
            cameraController.allowsEditing = true
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
        
        setMemeDefault()
    }
    
    @IBAction func ShareAction(_ sender: Any) {
        
        let memedImageToBeSaved = saveMeme()
        let activityView = UIActivityViewController(activityItems: [memedImageToBeSaved], applicationActivities: nil)
        activityView.completionWithItemsHandler = {(activity, completed, items, error) in
//            if (completed) {
//                let _ = self.save()
//            }
//        
        self.present(activityView, animated: true, completion: nil)
        }
    }
    
    //Selecting the image
    func selectImage(sourceType: UIImagePickerController.SourceType){
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
      //  imagePicker.sourceType = sourceType
        present(selectImageController, animated: true, completion: nil)
        
    }
    //Receiving selected image manipulation
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let editedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            imageView.image = editedImage
            imageView.contentMode = .scaleAspectFit
            shareButton.isEnabled = true
            
        }
            dismiss(animated: true, completion: nil)
    }
    //write a function to set all values of Meme object to default for cancel functionality
    func setMemeDefault(){
        
        imageView.image = nil
        topTextFieldOutlet.text = "TOP"
        bottomTextFieldOutlet.text = "BOTTOM"

    }
    
    //write a function to save the Meme object, it needs to take the 2 textfields plus the image
    
    
 //MemeStruct
    
    struct MemeStruct{
        
        var topTextFieldString: String
        var bottomTextFieldString: String
        var image: UIImage
        var memedImage: UIImage
        
        init(topTextFieldString: String, bottomTextFieldString: String, image: UIImage, memedImage: UIImage ) {
            self.topTextFieldString = topTextFieldString
            self.bottomTextFieldString = bottomTextFieldString
            self.image = image
            self.memedImage = memedImage
        }
    }
    
    //function to save image as a memedImage
    
    func generateMemedImage()->UIImage{
        
        // TODO: Hide toolbar and navbar
        
        
        
        // Render view to an image
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        
        let memedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsGetImageFromCurrentImageContext()
        return memedImage
    }
    
    
    func saveMeme(){
        
        let memedImage = generateMemedImage()
        _ = MemeStruct(topTextFieldString: topTextFieldOutlet.text!, bottomTextFieldString: bottomTextFieldOutlet.text!, image: imageView.image!, memedImage: memedImage)
    
        
    }
}

