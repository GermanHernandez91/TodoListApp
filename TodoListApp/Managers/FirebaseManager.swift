//
//  FirebaseManager.swift
//  TodoListApp
//
//  Created by German Hernandez on 2/12/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

protocol FirebaseManagerProtocol {
    func signInAnonymously() async throws -> AuthDataResult
    func getCurrentUserId() -> String?
    func fetch(for collection: CollectionType) async throws -> [QueryDocumentSnapshot]
    func save(for collection: CollectionType, with document: [String : Any], key: String) async throws -> Void
}

final class FirebaseManager: FirebaseManagerProtocol {
    
    static let shared = FirebaseManager()
    
    // MARK: - Properties
    private let db = Firestore.firestore()
    private let auth = Auth.auth()
    
    // MARK: - Methods
    func signInAnonymously() async throws -> AuthDataResult {
        return try await auth.signInAnonymously()
    }
    
    func getCurrentUserId() -> String? {
        return auth.currentUser?.uid
    }
    
    func fetch(for collection: CollectionType) async throws -> [QueryDocumentSnapshot] {
        
        guard let userId = getCurrentUserId() else { throw NetworkError.noAuthenticated }
        
        let result = try await db.collection(collection.rawValue)
            .whereField(FirebaseFields.userId, isEqualTo: userId)
            .getDocuments()
        
        return result.documents
    }
    
    func save(for collection: CollectionType, with document: [String : Any], key: String) async throws -> Void {
        try await db.collection(collection.rawValue).document(key).setData(document)
    }
}
