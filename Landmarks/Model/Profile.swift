//
//  Profile.swift
//  Landmarks
//
//  Created by ooooo333i on 7/2/24.
//

import Foundation

struct Profile{
    var username : String
    var prefersNotification = true
    var seasonablePhoto = Season.winter
    var goalDate = Date()
    
    static let `default` = Profile(username: "g_kumar")
    
    enum Season : String,CaseIterable,Identifiable{
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
        
        var id : String{rawValue}
    }
}
