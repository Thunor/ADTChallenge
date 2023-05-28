//
//  CharacterDetailView.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/27/23.
//

import SwiftUI

struct CharacterDetailView: View {
    @State var rmChar: RMCharacter
    
    var body: some View {
        ScrollView {
            VStack {
                CharDetailImageView(imageUrl: rmChar.image)
                
                InfoLineView(title: "Status:", infoTxt: rmChar.status ?? "")
                InfoLineView(title: "Species:", infoTxt: rmChar.species ?? "")
                InfoLineView(title: "Type:", infoTxt: rmChar.type ?? "")
                    .isHidden(rmChar.type == nil || rmChar.type == "", remove: rmChar.type == nil || rmChar.type == "")
                InfoLineView(title: "Gender:", infoTxt: rmChar.gender ?? "")
                InfoLineView(title: "Origin:", infoTxt: rmChar.origin?.name ?? "")
                InfoLineView(title: "Location:", infoTxt: rmChar.location?.name ?? "")
                Spacer()
            }
        }
        .navigationTitle(rmChar.name ?? "")
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
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
        
        CharacterDetailView(rmChar: previewCharacter)
    }
}
