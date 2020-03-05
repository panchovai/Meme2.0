//
//  Meme.swift
//  MemeMe2.0
//
//  Created by Francisco Jerez on 2/19/20.
//  Copyright © 2020 Francisco. All rights reserved.
//

import UIKit

//MemeStruct

struct MemeStruct{
    
    var topTextFieldString: String
    var bottomTextFieldString: String
    var image: UIImage?
    var memedImage: UIImage?
    
    init(topTextFieldString: String, bottomTextFieldString: String, image: UIImage, memedImage: UIImage ) {
        self.topTextFieldString = topTextFieldString
        self.bottomTextFieldString = bottomTextFieldString
        self.image = image
        self.memedImage = memedImage
    }
}
