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
    
    static func getEpisodes(page: Int = 1, completion: @escaping (Episode.NetworkResult?, Episode.NetworkInfo.Info?, String?) -> ()) {
        let page = "?page=\(page)"
        let wholeURL = URL(string: baseURL + classesURL + page)!
        var request = URLRequest(url: wholeURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                    case 200...299:
                        // decode it
                        if let retData = data {
                            let decoder = JSONDecoder()
                            let theModel: Episode.NetworkResult = try! decoder.decode(Episode.NetworkResult.self, from: retData)
                            let theInfo: Episode.NetworkInfo.Info = try! decoder.decode(Episode.NetworkInfo.Info.self, from: retData)
                            print(theInfo)
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
    
    static func getEpisodeDetail(episodeID: Int = 1, completion: @escaping (Episode?, String?) -> ()) {
        let episodeID = "\(episodeID)"
        let wholeURL = URL(string: baseURL + classesURL + episodeID)!
        var request = URLRequest(url: wholeURL)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            print(response!)
            if let response = response as? HTTPURLResponse {
                switch response.statusCode {
                    case 200...299:
                        // decode it
                        if let retData = data {
                            let decoder = JSONDecoder()
                            let theModel: Episode = try! decoder.decode(Episode.self, from: retData)
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
