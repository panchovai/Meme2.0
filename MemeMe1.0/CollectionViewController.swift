//
//  SentMemesViewController.swift
//  MemeMe2.0
//
//  Created by Francisco Jerez on 2/13/20.
//  Copyright © 2020 Francisco. All rights reserved.
//

import UIKit

class CollectionViewController: UIViewController {

    var memes: [ViewController.MemeStruct]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
