//
//  CharDetailImageView.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/27/23.
//

import SwiftUI

struct CharDetailImageView: View {
    @State var imageUrl: String?
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl ?? ""),
                   content: { image in
            image
                .resizable()
                .scaledToFill()
        }, placeholder: {
            Image(systemName: "person.fill")
                .resizable()
                .scaledToFill()
                .background(Color(red: 0.8, green: 0.8, blue: 0.8))
        })
        .frame(width: 200, height: 200, alignment: .center)
        .clipped()
    }
}

struct CharDetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        let imageString = "https://rickandmortyapi.com/api/character/avatar/1.jpeg"
        CharDetailImageView(imageUrl: imageString)
    }
}
