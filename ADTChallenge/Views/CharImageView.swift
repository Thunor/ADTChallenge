//
//  HeadshotView.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/27/23.
//

import SwiftUI


struct CharImageView: View {
    var rmCharacter: RMCharacter?
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: rmCharacter?.image ?? ""),
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
            .frame(width: 100, height: 100, alignment: .center)
            .clipped()
            
            Text(rmCharacter?.name ?? "")
                .frame(width: 100, alignment: .center)
                .font(.custom("Futura-Medium", size: 11, relativeTo: .footnote))
                .fontWeight(.bold)
                .fixedSize(horizontal: false, vertical: true)
                    
            Spacer()
        }
    }
}

struct CharImageView_Previews: PreviewProvider {
    static var previews: some View {
        
        let previewCharacter = RMCharacter(
            id: 1, name: "Rick Sanchez", status: "Alive", type: "", gender: "Male",
            origin: RMPlace(name: "Earth", url: "https://rickandmortyapi.com/api/location/1"),
            location: RMPlace(name: "Earth", url: "https://rickandmortyapi.com/api/location/20"),
            image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
            episode: [
                "https://rickandmortyapi.com/api/episode/1",
                "https://rickandmortyapi.com/api/episode/2"
            ],
            url: "https://rickandmortyapi.com/api/character/1",
            created: "2017-11-04T18:48:46.250Z"
        )
        
        CharImageView(rmCharacter: previewCharacter)
    }
}
