//
//  EpisodeDetail.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import Foundation
import SwiftUI

struct EpisodeDetailView: View {
    @State var detail: RMEpisode?
    @State private var rmCharacters: [RMCharacter] = []
    @State private var sounds = Sounds()
    
    var body: some View {
        ZStack {
            
            Color.init(red: 0.8, green: 0.8, blue: 0.8)
                .ignoresSafeArea()
            
            VStack(content: {
                HStack {
                    Text("\(detail?.name ?? "")")
                    Spacer()
                }
                .font(.title)
                .padding(10)
                .padding(.horizontal)
                
                HStack {
                    Text("air date: ")
                    Spacer()
                    Text("\(detail?.airDate ?? "")")
                }
                .padding(10)
                .padding(.horizontal)
                .isHidden(detail?.airDate == nil, remove: detail?.airDate == nil)
                
                HStack {
                    Text("Characters")
                    Spacer()
                }
                .padding(10)
                .padding(.horizontal)
                
                HorizontalCharView(charList: rmCharacters)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
                Spacer()
            })
            .foregroundColor(.black)
        }
        .accentColor(.orange)
        .onAppear {
            sounds.playRandom()
            
            RMAPI.getEpisodeDetail(episodeID: detail?.id ?? 0) { episode, message in
                detail = episode
                if let message = message {
                    print("getEpisodeDetail: \(message)")
                }
                
                for charURL in detail?.rmCharacters ?? [] {
                    RMAPI.getCharDetails(characterURL: charURL) { rmChar, msg in
                        if let rmChar = rmChar {
                            self.rmCharacters.append(rmChar)
                            print("character: \(rmChar.name ?? "")")
                        }
                    }
                }
            }
        }
        
        .navigationTitle(detail?.episode ?? "")
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let epDetail: RMEpisode? = RMEpisode(
            id: 1,
            name: "Pilot",
            airDate: "December 2, 2013",
            episode: "S01E01",
            characters: [
                "https://rickandmortyapi.com/api/character/1",
                "https://rickandmortyapi.com/api/character/2"
            ],
            url: "https://rickandmortyapi.com/api/episode/1",
            created: "2017-11-10T12:56:33.798Z"
        )
        EpisodeDetailView(detail: epDetail)
    }
}
