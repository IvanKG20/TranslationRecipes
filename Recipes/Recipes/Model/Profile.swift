//
//  Project.swift
//  Recipes
//
//  Created by Ivan on 2/18/23.
//

import Foundation
    
struct Profile {
    var username: String
    var prefersNotifications = true
    var seasonalPhoto = Season.winter
    var goalDate = Date()

    static let `default` = Profile(username: "test_username")

    enum Season: String, CaseIterable, Identifiable {
        case spring = "1"
        case summer = "2"
        case autumn = "3"
        case winter = "4"

        var id: String { rawValue }
    }
}
