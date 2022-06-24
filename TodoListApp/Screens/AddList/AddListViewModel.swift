//
//  AddListViewModel.swift
//  TodoListApp
//
//  Created by German Hernandez on 15/12/21.
//

import Foundation
import SwiftUI

final class AddListViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var isLoading: Bool = false
    @Published var errorMessage: String = ""
    @Published var hasError: Bool = false
    @Published var showSuccess: Bool = false
    @Published var title: String = ""
    @Published var selectedImage: CustomImages = .list
    @Published var selectedColor: Color = .red
    @Published var availableColors: [Color] = [.red, .yellow, .blue, .brown, .orange, .purple, .indigo]
    
    private let todoListService: TodoListServiceProtocol
    
    // MARK: - Lifecycle
    init(todoListService: TodoListServiceProtocol = TodoListService()) {
        self.todoListService = todoListService
    }
    
    // MARK: - Methods
    @MainActor
    func saveNewList() {
        
        isLoading = true
        
        Task {
            self.isLoading = false
            
            do {
                let todoList = TodoList(title: self.title, colorName: self.selectedColor.description, imageName: self.selectedImage.rawValue)
                try await todoListService.addList(with: todoList)
                self.showSuccess = true
                self.resetForm()
            } catch {
                self.hasError = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    private func resetForm() {
        self.title = ""
        self.selectedImage = .list
        self.selectedColor = .red
    }
}
