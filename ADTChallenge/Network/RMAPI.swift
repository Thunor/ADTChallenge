//
//  RMAPI.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import Foundation

struct RMAPI {
    static let baseURL = "https://rickandmortyapi.com"
    static let classesURL = "/api/episode/"
    
    static func getEpisodes(page: Int = 1, completion: @escaping (RMEpisode.NetworkResult?, RMEpisode.NetworkInfo.Info?, String?) -> ()) {
        let page = "?page=\(page)"
        let wholeURL = URL(string: baseURL + classesURL + page)!
        var request = URLRequest(url: wholeURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        // attempt to download the episodes.  If
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            print(response!)
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                    case 200...299:
                        // decode it
                        if let retData = data {
                            let decoder = JSONDecoder()
                            let theModel: RMEpisode.NetworkResult = try! decoder.decode(RMEpisode.NetworkResult.self, from: retData)
                            let theInfo: RMEpisode.NetworkInfo.Info = try! decoder.decode(RMEpisode.NetworkInfo.Info.self, from: retData)
//                            print(theInfo)
//                            print(theModel)
                            completion(theModel, theInfo, "success")
                        }
                    default:
                        if let error = error {
                            print(error)
                        } else {
                            print("Error")
                        }
                        completion(nil, nil, "got an error")
                }
            }
        })
        
        task.resume()
    }
    
    static func getEpisodeDetail(episodeID: Int = 1, completion: @escaping (RMEpisode?, String?) -> ()) {
        let episodeID = "\(episodeID)"
        let wholeURL = URL(string: baseURL + classesURL + episodeID)!
        var request = URLRequest(url: wholeURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            print(response!)
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                    case 200...299:
                        // decode it
                        if let retData = data {
                            let decoder = JSONDecoder()
                            let theModel: RMEpisode = try! decoder.decode(RMEpisode.self, from: retData)
//                            print(theModel)
                            completion(theModel, "success")
                        }
                    default:
                        if let error = error {
                            print(error)
                        } else {
                            print("Error")
                        }
                        completion(nil, "got an error")
                }
            }
        })
        
        task.resume()
    }
    
//    "characters": [
//      "https://rickandmortyapi.com/api/character/1",
//      "https://rickandmortyapi.com/api/character/2",
//      //...
//    ],
    
    /// Get a single character record
    /// - Parameters:
    ///   - characterURL: The url to the record.
    ///   - completion: The closure returns the Character and "success", or nil and an error message.
    static func getCharDetails(characterURL: String, completion: @escaping (RMCharacter?, String?) -> ()) {
        let wholeURL = URL(string: characterURL)
        if let wholeCharURL = wholeURL {
            var request = URLRequest(url: wholeCharURL)
            request.httpMethod = "GET"
            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let session = URLSession.shared
            let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//                print(response!)
                if let response = response as? HTTPURLResponse {
                    switch response.statusCode {
                        case 200...299:
                            // decode it
                            if let retData = data {
                                let decoder = JSONDecoder()
                                let theModel: RMCharacter = try! decoder.decode(RMCharacter.self, from: retData)
                                //                            print(theModel)
                                completion(theModel, "success")
                            }
                        default:
                            if let error = error {
                                print(error)
                            } else {
                                print("Error")
                            }
                            completion(nil, "got an error")
                    }
                }
            })
            
            task.resume()
        }
    }
}
