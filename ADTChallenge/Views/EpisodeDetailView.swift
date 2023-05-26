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
        VStack {
            Text(detail?.episode ?? "*")
                .caption()
        }
        .onAppear {
            RMAPI.getEpisodeDetail(episodeID: detail?.id ?? 0) { episode, message in
                detail = episode
                print("got detail")
            }
        }
    }
}

struct EpisodeDetailView_Previews: PreviewProvider {
    var epDetail: Episode? = Episode(id: 1,
                         name: "Pilot",
                         airDate: "December 2, 2013",
                         episode: "S01E01",
                         characters: [
                            "https://rickandmortyapi.com/api/character/1",
                            "https://rickandmortyapi.com/api/character/2"
                         ],
                         url: "https://rickandmortyapi.com/api/episode/1")
    
    static var previews: some View {
//        epi
        EpisodeDetailView()
//        EpisodeDetailView(detail: epDetail)
    }
}
