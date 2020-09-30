//
//  constants.swift
//  MediaFinder
//
//  Created by Abdelrady on 8/7/20.
//  Copyright © 2020 Abdelrady. All rights reserved.
//

import Foundation

struct StoryBoard_C {
    static let main: String = "Main"
}

struct ViewController_C {
    static let signUp: String = "signUpVC"
    static let signIn: String = "signInVC"
    static let profile: String = "profileVC"
    static let map: String = "mapVC"
    static let movieList: String = "movieListVC"
}

struct RegexPattern_C{
    static let mail: String = "([a-zA-Z0-9_]+)@([a-zA-Z0-9_]+)\\.([a-zA-Z]{2,5})"
    static let password: String = "(?=.*\\d).{4,}"
}

struct UserDefault_C {
    static let userDefault: String = "userDefault"
    static let isLogged: String = "isLogged"
    static let isRegistered: String = "isRegistered"
}

struct Flag_C{
    static let registered = "Registerd"
    static let loggedIn = "loggedIn"
}

struct TableCellsID_C{
    static let movieCell = "movieCell"
}

struct NibFiles_C{
    static let movieCell = "movieCell"
}






