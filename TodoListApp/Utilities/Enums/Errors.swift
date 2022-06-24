//
//  Errors.swift
//  TodoListApp
//
//  Created by German Hernandez on 2/12/21.
//

import Foundation

enum NetworkError: Error {
    case noAuthenticated
    case noData
    case somethingWentWrong
    case failure(error: Error)
    case unknown
}
