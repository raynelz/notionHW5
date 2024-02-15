//
//  ItemsModel.swift
//  notionHW5
//
//  Created by Захар Литвинчук on 12.02.2024.
//

import UIKit

struct Items {
    let title: String
    let icon: UIImage?
    let category: Category
    let hasSwitch: Bool
}

enum Category {
    case media
    case preferences
    case account
}



struct ImageName {
    static let wishlist = "heart"
    static let download = "icloud.and.arrow.down.fill"
    static let darkMode = "moon"
    static let language = "globe"
    static let logout = "rectangle.portrait.and.arrow.right"
    static let privacy = "hand.raised"
}

struct Source {
    static func makeItems() -> [Items] {
        [
            .init(title: "Wishlist", icon: .init(systemName: ImageName.wishlist), category: .media, hasSwitch: false),
            .init(title: "Download", icon: .init(systemName: ImageName.download), category: .media, hasSwitch: false),
            .init(title: "Dark Mode", icon: .init(systemName: ImageName.darkMode), category: .preferences, hasSwitch: true),
            .init(title: "Language", icon: .init(systemName: ImageName.language), category: .preferences, hasSwitch: false),
            .init(title: "Log Out", icon: .init(systemName: ImageName.logout), category: .account, hasSwitch: false),
            .init(title: "Privacy", icon: .init(systemName: ImageName.privacy), category: .account, hasSwitch: false)
        ]
    }
    
    static func makeItemsWithGroup() -> [[Items]] {
        
        let media = makeItems().filter({ $0.category == .media })
        let preferences = makeItems().filter({ $0.category == .preferences })
        let account = makeItems().filter({ $0.category == .account })
        let hasSwitch = makeItems()
        
        return [media, preferences, account, hasSwitch]
    }
}
