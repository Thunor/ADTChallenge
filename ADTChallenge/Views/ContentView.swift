//
//  ContentView.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var episodes: [RMEpisode]?
    @State private var info: RMEpisode.NetworkInfo.Info?
    @State private var currentPage: Int = 1
    
    
    
    var body: some View {
            
            NavigationView {
                ZStack {
                    Color.init(red: 0.8, green: 0.8, blue: 0.8)
                        .ignoresSafeArea()
                    
                    VStack {
                        ScrollView {
                            ForEach(episodes ?? [], id: \.id) { episode in
                                NavigationLink {
                                    EpisodeDetailView(detail: episode)
                                } label: {
                                    HStack {
                                        Text(episode.name ?? "")
                                            .foregroundColor(.black)
                                        Spacer()
                                        Image(systemName: "chevron.right")
                                            .fontWeight(.heavy)
                                    }
                                    .caption(backgroundColor: .gray)
                                }
                                .onBecomingVisible {
                                    if (episode.id ?? 1) % 20 == 0 {
                                        if info?.info?.next != nil {
                                            print("id: \(episode.id ?? 0)")
                                            currentPage += 1
                                            loadMore()
                                        } else {
                                            print("No more data..")
                                        }
                                    }
                                }
                            }
                        }
                    }
                    .padding()
                }
                .onAppear {
                    RMAPI.getEpisodes(page: 1, completion: { model, theInfo, message in
                        episodes = model?.results
                        info = theInfo
                        print("added first page")
                    })
                }
                .navigationBarTitleDisplayMode(.large)
                .navigationTitle("Episodes")
            }
            .background(Color.teal)
    }
    
    /// Load next page of data
    func loadMore() {
        RMAPI.getEpisodes(page: currentPage, completion: { model, theInfo, message in
            episodes?.append(contentsOf: model?.results ?? [])
            info = theInfo
            print("added data")
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
