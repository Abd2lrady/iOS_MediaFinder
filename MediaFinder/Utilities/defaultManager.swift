//
//  defaultManager.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/10/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import Foundation




class UserDefaultData{
    // Disabling Default Constructor
    private init(){}
    
    static private let sharedInstance = UserDefaultData()
    
    static func createSharedInstance()->UserDefaultData{
        return UserDefaultData.sharedInstance
    }
    
    var isLogged: Bool?{
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefault_C.isLogged)
        }
        get {
            return UserDefaults.standard.object(forKey: UserDefault_C.isLogged) as? Bool
        }
    
    }
    
    var isRegistered: Bool?{
        set {
            UserDefaults.standard.set(newValue, forKey: UserDefault_C.isRegistered)
        }
        get {
            return UserDefaults.standard.object(forKey: UserDefault_C.isRegistered) as? Bool
        }
    }
    
    var user: User?{
        set{
            let encodedUser = try? JSONEncoder().encode(newValue)
            UserDefaults.standard.set(encodedUser, forKey: UserDefault_C.userDefault)
        }
        get{
            let encodedUser = UserDefaults.standard.object(forKey: UserDefault_C.userDefault)
            let decodedUser = try? JSONDecoder().decode(User.self, from: encodedUser as! Data)
            return decodedUser
        }
    }
    
    
}
