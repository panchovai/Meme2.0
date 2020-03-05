//
//  SentMemesViewController.swift
//  MemeMe2.0
//
//  Created by Francisco Jerez on 2/13/20.
//  Copyright © 2020 Francisco. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var CollectionViewFlowLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var CollectionViewCell: UICollectionViewCell!
    
    var memes: [MemeStruct]! {
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        return appDelegate.memes
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       collectionView?.reloadData();
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
//        let meme = self.memes[(indexPath as NSIndexPath).row]
//        
//        // Set the name and image
//        cell.nameLabel.text = meme.name
//        cell.villainImageView?.image = UIImage(named: meme.imageName)
//        
//        return cell
//    }
    
//    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
//
//        let detailController = storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! CollectionViewCell
//        detailController.meme = memes[(indexPath as NSIndexPath).row]
//        navigationController!.pushViewController(detailController, animated: true)
//    }

    
    
    
    
}
