//
//  AddListView.swift
//  TodoListApp
//
//  Created by German Hernandez on 15/12/21.
//

import SwiftUI

struct AddListView: View {
    
    @StateObject private var viewModel = AddListViewModel()
    
    var body: some View {
        VStack {
            if viewModel.isLoading {
                ProgressView().offset(y: -40)
            } else {
                Form {
                    Section("List Title") {
                        TextField("Title", text: $viewModel.title)
                    }
                    
                    Section("List Images") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(CustomImages.allCases) { image in
                                    CustomImageView(selectedImage: $viewModel.selectedImage, image: image)
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                        }
                    }
                    
                    Section("List Colour") {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 20) {
                                ForEach(viewModel.availableColors, id: \.self) { color in
                                    color
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(10)
                                        .onTapGesture {
                                            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                                            viewModel.selectedColor = color
                                        }
                                }
                            }
                            .padding(.horizontal, 10)
                            .padding(.vertical, 5)
                        }
                        
                        HStack {
                            Text("Selected color:")
                            viewModel.selectedColor
                                .frame(width: 25, height: 25)
                                .cornerRadius(15)
                                .animation(.linear, value: viewModel.selectedColor)
                        }
                        .padding(10)
                    }
                }
                .navigationTitle("Add List")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.saveNewList()
                        } label: { SystemImages.plusImage }
                    }
                }
                .alert("Something went wrong", isPresented: $viewModel.hasError) {
                    Button("Ok", role: .cancel, action: {})
                } message: {
                    Text(viewModel.errorMessage)
                }
                .alert("Success!", isPresented: $viewModel.showSuccess) {
                    Button("Ok", role: .cancel, action: {})
                } message: {
                    Text("Your new list has been created successfully.")
                }
            }
        }
    }
}

struct AddListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddListView()
        }
    }
}
