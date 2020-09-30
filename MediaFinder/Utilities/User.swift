//
//  User.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/3/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import UIKit

enum Gender: String, Codable{
    case male
    case female
}

struct User: Codable{
    var name: String
    var email: String
    var password: String
    var phone: String
    var address: String
    var gender: Gender
    var image: userImage
}

struct userImage:Codable {
    let image: Data?
    init(with image: UIImage) {
        self.image = image.jpegData(compressionQuality: 1.0)
    }
    func getImage()->UIImage?{
        guard let image = self.image else{return nil}
        return UIImage(data: image)
    }
    
    
}




