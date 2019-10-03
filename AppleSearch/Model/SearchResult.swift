//
//  SearchResult.swift
//  AppleSearch
//
//  Created by Michael Flowers on 10/3/19.
//  Copyright © 2019 Michael Flowers. All rights reserved.
//

import Foundation

struct MusicSearchDictionary: Codable {
    let results: [MusicSearchResult]
}

struct MusicSearchResult: Codable {
    let artistName: String
    let trackName: String
    let artworkUrl100: String?
}

struct AppSearchDictionary: Codable {
    let results: [AppSearchResult]
}

struct AppSearchResult: Codable {
    let trackName: String
    let description: String
    let artworkUrl100: String?

}

