//
//  EpisodeDetail.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    @State var detail: Episode?
    
    var body: some View {
        ZStack {
            
            Color.init(red: 0.8, green: 0.8, blue: 0.8)
                .ignoresSafeArea()
            
            VStack(content: {
                HStack {
                    Text("episode: ")
                    Spacer()
                    Text("\(detail?.episode ?? "")")
                }
                .padding(10)
                .cornerRadius(6.0)
                .padding(.horizontal)
                
                HStack {
                    Text("name: ")
                    Spacer()
                    Text("\(detail?.name ?? "")")
                }
                .padding(10)
                .cornerRadius(6.0)
                .padding(.horizontal)
                
                HStack {
                    Text("air date: ")
                    Spacer()
                    Text("\(detail?.airDate ?? "")")
                }
                .padding(10)
                .cornerRadius(6.0)
                .padding(.horizontal)
                
                HStack {
                    Text("creation date: ")
                    Spacer()
                    Text("\(detail?.created ?? "")")
                }
                .padding(10)
                .cornerRadius(6.0)
                .padding(.horizontal)
                
                // I would display a CharacterList() here
                
                Spacer()
            })
            .foregroundColor(.white)
        }
        .accentColor(.orange)
        .onAppear {
            RMAPI.getEpisodeDetail(episodeID: detail?.id ?? 0) { episode, message in
                detail = episode
                print("got detail")
            }
            
            // Need to get the Character array here, using the detail.character endpoints,
            // then it would populate the CharacterList() view.  In that view, I would, as a
            // minimum show the character name and image, with other data as needed.
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    
    static var previews: some View {
        let epDetail: Episode? = Episode(
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
