//
//  ITunesAdaptor.swift
//  MusicByLocation
//
//  Created by ManLikeMe on 04/03/2020.
//  Copyright © 2020 SingularBro. All rights reserved.
//

import Foundation

class ITunesAdaptor {
    let baseUrl = "https://itunes.apple.com/search"
    let decoder = JSONDecoder()
    
    func getArtists(search: String?, completion: ([Artist]?) -> Void) {
        guard let search = search else {
            print("No search term provided. Terminating request")
            return
        }
        
        let path = "/term=\(search)&entity=musicArtist".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        guard let url = URL(string: baseUrl + path) else {
            print("Invalid URL. Wasn't able to search ITunes")
            completion(nil)
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data = data {
                if let response = self.parseJson(json: data) {
                    let names = response.results.map {
                        return $0.artistName
                    }
                    
                    DispatchQueue.main.async {
                        self.musicRecommendations.text = names.joined(separator: ", \n")
                    }
                }
            }
        }.resume()
    }
    
    func parseJson(json: Data) -> ArtistResponse? {
        let decoder = JSONDecoder()
        
        if let artistResponse = try? decoder.decode(ArtistResponse.self, from: json) {
            return artistResponse
        } else {
            print("failed to decode to artist response")
            return nil
        }
    }
}
