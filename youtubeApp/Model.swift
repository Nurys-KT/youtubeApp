//
//  Model.swift
//  youtubeApp
//
//  Created by KYUNGTAE KIM on 2021/02/23.
//

import Foundation

class Model {
    
    func getVideos() {
        // Create a URL object
        guard let url = URL(string: Constants.API_URL) else { return }
        
        // get a URLsession object
        let session = URLSession.shared
        
        // get a data task
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            guard error == nil, data != nil else { return }
            
            let decoder = JSONDecoder()
            // Decoding중에 String으로 되어있지만 실제로 앱에서 Date타입으로 쓰려고 할때 사용
            decoder.dateDecodingStrategy = .iso8601
            
            do {
                let response = try decoder.decode(Response.self, from: data!)
                dump(response)
            } catch {
                print("---> json decoding error : \(error.localizedDescription)")
            }
            
            
        }
        
        // kick of the task
        dataTask.resume()
    }
    
}
