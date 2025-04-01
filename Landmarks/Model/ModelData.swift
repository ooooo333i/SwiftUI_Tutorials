//
//  ModelData.swift
//  Landmarks
//
//  Created by ooooo333i on 7/1/24.
//

import Foundation

@Observable
class ModelData{
    var landmarks: [Landmark] = load("landmarkData.json")
    var hikes : [Hike] = load("hikeData.json")
    var profile = Profile.default
    
    var feature : [Landmark]{
        landmarks.filter{$0.isFeatured}
    }
    var categories : [String : [Landmark]]{
        Dictionary(
            grouping: landmarks,
            by : {$0.category.rawValue}
        )
    }
}



func load < T: Decodable>(_ filename:String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Couldn't load \(filename) from main bundle.")
    }
    
    do{
        data = try Data(contentsOf: file)
    }catch{
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do{
        let decorder = JSONDecoder()
        return try decorder.decode(T.self, from: data)
    }catch{
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
