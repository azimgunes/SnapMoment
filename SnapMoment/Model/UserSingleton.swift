//
//  UserSingleton.swift
//  SnapMoment
//
//  Created by Azim Güneş on 1.06.2023.
//

import Foundation

class UserSingleton {
    
    static let sharedUserInfo = UserSingleton()
    
    var email = ""
    var username = ""
    
    
    
    private init (){
    
    }
}
