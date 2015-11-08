//
//  Song.swift
//
//
//  Created by Franks, Kent on 10/2/15.
//
//

import Foundation

public struct Song {
    public let name:String
    public let artist:String
    public let genre:String
    
    public init(nameIn:String, artistIn:String, genreIn:String) {
        name = nameIn
        artist = artistIn
        genre = genreIn
    }
}
