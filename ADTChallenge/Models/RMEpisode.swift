//
//  Episode.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import Foundation


/*
 {
   "info": {
     "count": 51,
     "pages": 3,
     "next": "https://rickandmortyapi.com/api/episode?page=2",
     "prev": null
   },
   "results": [
     {
       "id": 1,
       "name": "Pilot",
       "air_date": "December 2, 2013",
       "episode": "S01E01",
       "characters": [
         "https://rickandmortyapi.com/api/character/1",
         "https://rickandmortyapi.com/api/character/2",
         //...
       ],
       "url": "https://rickandmortyapi.com/api/episode/1",
       "created": "2017-11-10T12:56:33.798Z"
     },
     // ...
   ]
 }
 */

struct RMEpisode: Codable {
    var id: Int?
    var name: String?
    var airDate: String?
    var episode: String?
    var rmCharacters: [String]?
    var url: String?
    var created: String?
    
    enum CodingKeys: CodingKey {
        case id
        case name
        case airDate
        case episode
        case characters
        case url
        case created
    }
    
    init(id: Int? = 0, name: String? = "", airDate: String? = "", episode: String? = "", characters: [String]? = [], url: String? = "", created: String? = "") {
        self.id = id
        self.name = name
        self.airDate = airDate
        self.episode = episode
        self.rmCharacters = characters
        self.url = url
        self.created = created
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.airDate = try container.decodeIfPresent(String.self, forKey: .airDate)
        self.episode = try container.decodeIfPresent(String.self, forKey: .episode)
        self.rmCharacters = try container.decode([String]?.self, forKey: .characters)
        self.url = try container.decodeIfPresent(String.self, forKey: .url)
        self.created = try container.decodeIfPresent(String.self, forKey: .created)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.airDate, forKey: .airDate)
        try container.encodeIfPresent(self.episode, forKey: .episode)
        try container.encode(self.rmCharacters, forKey: .characters)
        try container.encodeIfPresent(self.url, forKey: .url)
        try container.encodeIfPresent(self.created, forKey: .created)
    }
}

extension RMEpisode {
    struct NetworkResult: Codable {
        var results: [RMEpisode]?
    }
}

extension RMEpisode {
    struct NetworkInfo: Codable {
        var count: Int?
        var pages: Int?
        var next: String?
        var prev: String?
        
        struct Info: Codable {
            var info: NetworkInfo?
        }
    }
}
