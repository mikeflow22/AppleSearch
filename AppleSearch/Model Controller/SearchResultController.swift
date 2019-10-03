//
//  SearchResultController.swift
//  AppleSearch
//
//  Created by Michael Flowers on 10/3/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct StringConstants {
    fileprivate static let url = "https://itunes.apple.com"
    fileprivate static let searchComponent = "search"
    fileprivate static let termKey = "term"
    fileprivate static let entityKey = "entity"
    fileprivate static let musicTrack = "musicTrack"
    fileprivate static let softwareKey = "software"
}

class SearchResultController {
    static func getMusicWith(searchText: String, completion: @escaping ([MusicSearchResult]) -> Void){
        var baseURL = URL(string:StringConstants.url)!
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        baseURL.appendPathComponent(StringConstants.searchComponent)
        let searchTermQuery = URLQueryItem(name: StringConstants.termKey, value: searchText)
        let entityQuery = URLQueryItem(name: StringConstants.entityKey, value: StringConstants.musicTrack)
        urlComponents?.queryItems = [searchTermQuery, entityQuery]
        
        guard let finalURL = urlComponents?.url else {
            print("Error with url")
            completion([])
            return
        }
        print("this is the url: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in the data task: \(error) //// \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Error unwrapping data")
                completion([])
                return
            }
            
            do {
                let jD = JSONDecoder()
                let movieSearchResults = try jD.decode(MusicSearchDictionary.self, from: data).results
                completion(movieSearchResults)
            } catch {
                print("Error decoding music objects: \(error) ///\(error.localizedDescription)")
                completion([])
                return
            }
        }.resume()
    }
    
    
    static func getMusicWith(searchText: String, completion: @escaping ([AppSearchResult]) -> Void){
        var baseURL = URL(string:StringConstants.url)!
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        baseURL.appendPathComponent(StringConstants.searchComponent)
        let searchTermQuery = URLQueryItem(name: StringConstants.termKey, value: searchText)
        let entityQuery = URLQueryItem(name: StringConstants.entityKey, value: StringConstants.softwareKey)
        urlComponents?.queryItems = [searchTermQuery, entityQuery]
        
        guard let finalURL = urlComponents?.url else {
            print("Error with url")
            completion([])
            return
        }
        
        print("this is the url: \(finalURL)")
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            if let error = error {
                print("Error in the data task: \(error) //// \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Error unwrapping data")
                completion([])
                return
            }
            
            do {
                let jD = JSONDecoder()
                let appSearchResult = try jD.decode(AppSearchDictionary.self, from: data).results
                completion(appSearchResult)
            } catch {
                print("Error decoding music objects: \(error) ///\(error.localizedDescription)")
                completion([])
                return
            }
            }.resume()
    
    }
    
}
