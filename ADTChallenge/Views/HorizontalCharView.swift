//
//  HorizontalCharView.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/27/23.
//

import SwiftUI

struct HorizontalCharView: View {
    var charList: [RMCharacter]?
    @State private var selectedChar: String?
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            /// Using LazyHStack uses about half the memory of HStack here.
            LazyVGrid(columns: columns) {
                ForEach(charList ?? [], id: \.id) {currChar in
                    NavigationLink {
                        CharacterDetailView(rmChar: currChar)
                    } label: {
                        CharImageView(rmCharacter: currChar)
                    }
                }
            }
        }
    }
}

struct HorizontalCharView_Previews: PreviewProvider {
    static var previews: some View {
        let previewCharacter1: RMCharacter = RMCharacter(
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
        let previewCharacter2: RMCharacter = RMCharacter(
            id: 341, name: "Rick Sanchez", status: "Alive", type: "", gender: "Male",
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
        let previewCharacter3: RMCharacter = RMCharacter(
            id: 342, name: "Rick Sanchez", status: "Alive", type: "", gender: "Male",
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
        let previewCharacter4: RMCharacter = RMCharacter(
            id: 343, name: "Rick Sanchez", status: "Alive", type: "", gender: "Male",
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
        
        HorizontalCharView(charList: [previewCharacter1, previewCharacter2, previewCharacter3, previewCharacter4])
    }
}
