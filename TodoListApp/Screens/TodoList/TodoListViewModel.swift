//
//  TodoListViewModel.swift
//  TodoListApp
//
//  Created by German Hernandez on 4/12/21.
//

import Foundation

final class TodoListViewModel: ObservableObject {
    
    // MARK: - Properties
    private let todoListService: TodoListServiceProtocol
    
    // MARK: - Publishers
    @Published var lists: [TodoList] = []
    
    // MARK: - Lifecycle
    init(todoListService: TodoListServiceProtocol = TodoListService()) {
        self.todoListService = todoListService
    }
    
    // MARK: - Methods
    @MainActor
    func getLists() {
        
        Task {
            do {
                let lists = try await todoListService.fetchLists()
                self.lists = lists
            } catch {
                AppLogger.log(for: .error, with: error.localizedDescription)
            }
        }
    }
}
