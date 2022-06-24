//
//  TodoListAppApp.swift
//  TodoListApp
//
//  Created by German Hernandez on 2/12/21.
//

import SwiftUI
import Firebase

@main
struct TodoListAppApp: App {
    
    init() {
        FirebaseApp.configure()
        
        Task {
            do {
                let _ = try await FirebaseManager.shared.signInAnonymously()
            } catch {
                AppLogger.log(for: .error, with: error.localizedDescription)
                AnalyticsManager.track(for: .signIn, key: "error", value: error.localizedDescription)
            }
            
        }
    }
    
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}
