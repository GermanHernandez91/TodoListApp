//
//  TodoListView.swift
//  TodoListApp
//
//  Created by German Hernandez on 4/12/21.
//

import SwiftUI

struct TodoListView: View {
    
    @StateObject private var viewModel = TodoListViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.lists) { list in
                NavigationLink(destination: Text(list.title)) {
                    HStack(spacing: 15) {
                        VStack {
                            Image(systemName: list.imageName).foregroundColor(.white)
                        }
                        .frame(width: 35, height: 35)
                        .background(Color(list.colorName))
                        .clipShape(Circle())
                        
                        Text(list.title).font(.headline)
                    }
                }
            }
            .navigationBarTitle("TodoList")
            .onAppear { viewModel.getLists() }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: AddListView()) {
                        SystemImages.plusCircleImage
                    }
                }
            }
        }
    }
}

struct TodoListView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView()
    }
}
