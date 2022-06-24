//
//  CustomImages.swift
//  TodoListApp
//
//  Created by German Hernandez on 15/12/21.
//

import Foundation

enum CustomImages: String, CaseIterable {
    case house = "house"
    case folder = "folder"
    case document = "doc"
    case calendar = "calendar"
    case list = "list.bullet.circle"
}

extension CustomImages: Identifiable {
    var id: Self { self }
}
