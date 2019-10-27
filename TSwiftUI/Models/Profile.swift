//
//  Profile.swift
//  TSwiftUI
//
//  Created by zhanlijia on 2019/10/26.
//  Copyright © 2019 zhanlijia. All rights reserved.
//

import Foundation

struct Profile {
    var username:String
    var prefersNotifications:Bool
    var seasonalPhoto:Season
    var goalDate:Date
    
    static let `default` = Self(username: "g_kumar", prefersNotifications: true, seasonalPhoto: .winter)
    
    init(username:String,prefersNotifications:Bool,seasonalPhoto:Season) {
        self.username = username
        self.prefersNotifications = prefersNotifications
        self.seasonalPhoto = seasonalPhoto
        self.goalDate = Date()
    }
    
    enum Season:String,CaseIterable {
        case spring = "🌷"
        case summer = "🌞"
        case autumn = "🍂"
        case winter = "☃️"
    }
}

