//
//  TodoListService.swift
//  TodoListApp
//
//  Created by German Hernandez on 2/12/21.
//

import Foundation
import FirebaseFirestore

protocol TodoListServiceProtocol {
    func fetchLists() async throws -> [TodoList]
    func addList(with list: TodoList) async throws -> Void
}

final class TodoListService: TodoListServiceProtocol {
    
    func fetchLists() async throws -> [TodoList] {
        let documents = try await FirebaseManager.shared.fetch(for: .lists)
        
        return documents.compactMap { document in
            try? document.data(as: TodoList.self)
        }
    }
    
    func addList(with list: TodoList) async throws -> Void {
        guard let userId = FirebaseManager.shared.getCurrentUserId() else { throw NetworkError.noAuthenticated }
        
        var document = list.toDocument()
        document[FirebaseFields.userId] = userId
        
        try await FirebaseManager.shared.save(for: .lists, with: document, key: list.title)
    }
}
