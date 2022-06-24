//
//  TodoList.swift
//  TodoListApp
//
//  Created by German Hernandez on 2/12/21.
//

import Foundation
import FirebaseFirestoreSwift
import FirebaseDatabaseSwift

struct TodoList: Codable, Identifiable {
    @DocumentID var id: String?
    var title: String
    var colorName: String
    var imageName: String
    var userId: String?
}

extension TodoList {
    
    func toDocument() -> [String:Any] {
        return [
            "title": self.title,
            "colorName": self.colorName,
            "imageName": self.imageName
        ]
    }
}
