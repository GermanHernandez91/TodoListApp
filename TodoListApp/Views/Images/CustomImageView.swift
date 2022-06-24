//
//  CustomImageView.swift
//  TodoListApp
//
//  Created by German Hernandez on 15/12/21.
//

import SwiftUI

struct CustomImageView: View {
    
    @Binding var selectedImage: CustomImages
    let image: CustomImages
    
    var body: some View {
        VStack {
            Image(systemName: image.rawValue)
                .resizable()
                .foregroundColor(
                    selectedImage == image ? Color.white : Color.black
                )
                .frame(width: 25, height: 25)
        }
        .padding()
        .background(
            selectedImage == image ? Color.accentColor : Color.secondary.opacity(0.1)
        )
        .cornerRadius(5)
        .onTapGesture {
            UIImpactFeedbackGenerator(style: .medium).impactOccurred()
            selectedImage = image
        }
        .animation(.linear, value: selectedImage)
    }
}

struct CustomImageView_Previews: PreviewProvider {
    static var previews: some View {
        CustomImageView(selectedImage: .constant(.list), image: .list)
    }
}
