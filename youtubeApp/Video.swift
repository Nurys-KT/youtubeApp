//
//  Video.swift
//  youtubeApp
//
//  Created by KYUNGTAE KIM on 2021/02/23.
//

import Foundation

struct Video: Decodable {
    
    var videoId: String
    var title: String
    var description: String
    var thumbnail: String
    var published: Date
    
    enum CodingKeys: String, CodingKey {
        
        // 여기서 키값이 컨테이너 하위에 있는 것들에 바로 접근하기 위해, 경로에 있는 key값들도 포함시켜준다.
        case snippet
        case thumbnails
        case high
        case resourceId
        
        case published = "publishedAt"
        case title
        case description
        case thumbnail = "url"
        case videoId
    }
    
    init(from decoder: Decoder) throws {
        // container는 JSON에서 { } 단위라고 보면 됨. 이것들 포함하는 { } 가져오기.
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        // 하위에 있는 container 가져오기
        let snippetContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .snippet)
        
        // Parse Title
        self.title = try snippetContainer.decode(String.self, forKey: .title)
        
        // parse description
        self.description = try snippetContainer.decode(String.self, forKey: .description)
        
        // parse the publish date
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        // parse thumbnail
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .thumbnails)
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .high)
        
        self.thumbnail = try highContainer.decode(String.self, forKey: .thumbnail)
        
        // parse videoId
        let resourceIdContainer = try snippetContainer.nestedContainer(keyedBy: CodingKeys.self, forKey: .resourceId)
        self.videoId = try resourceIdContainer.decode(String.self, forKey: .videoId)
        
    }
    
}
