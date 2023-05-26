//
//  ContentView.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import SwiftUI

struct ContentView: View {
    @State private var episodes: [Episode]?
    @State private var currentPage: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(episodes ?? [], id: \.id) { episode in
                        NavigationLink {
                            EpisodeDetailView(detail: episode)
                        } label: {
                            HStack {
                                Text(episode.name ?? "")
                                    .foregroundColor(.white)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .fontWeight(.heavy)
                            }
                            .caption(backgroundColor: .orange)
                        }
                        .onBecomingVisible {
                            if (episode.id ?? 1) % 20 == 0 {
                                print("id: \(episode.id ?? 0)")
                                currentPage += 1
                                loadMore()
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                RMAPI.getEpisodes(page: 1, completion: { model, message in
                    episodes = model?.results
                    print("added first page")
                })
            }
        }
    }
    
    func loadMore() {
        
        RMAPI.getEpisodes(page: currentPage, completion: { model, message in
            episodes?.append(contentsOf: model?.results ?? [])
            print("added data")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
