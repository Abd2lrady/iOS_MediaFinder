//
//  Validation.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/9/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import Foundation

class UserDataValidation{
    
    // checking regex pattern
    // ----------------------
    func isRegexMatched(text: String, regex: String)->Bool{
        let test = NSPredicate(format: "SELF MATCHES %@",regex)
         return test.evaluate(with: text)
        
    }
    
    //    checking empty fields
    //    ---------------------
    func isEmpty(data: String)->Bool{
        guard data != "" else{
            return true
        }
        return false
    }
    
}
