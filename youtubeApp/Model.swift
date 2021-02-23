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
            
            
            
        }
        
        // kick of the task
        dataTask.resume()
    }
    
}
