//
//  NewYorkTimesAPI.swift
//  New York Times
//
//  Created by user on 28.04.2020.
//  Copyright © 2020 user. All rights reserved.
//

import Alamofire
import SWXMLHash
import Foundation

struct Task {
    let section: String
    var path: String {
        return section + ".xml"
    }
}

struct NYTimesAPI {
    let baseURL = "https://rss.nytimes.com/services/xml/rss/nyt/"
    let method: HTTPMethod = .get
    var task: Task = Task(section: "")
    var request: String {
        switch method {
        case .get:
            return baseURL + task.path
        default:
            return ""
        }
    }
}

class NYTimesProvider {
    
    var api = NYTimesAPI()
    
    init() { }
    
    func getPosts(section: String, completion: @escaping (Result<[Post], Error>) -> Void) {
        
        api.task = Task(section: section)
        AF.request(api.request, method: api.method, parameters: nil)
            .response { (request) in
                switch request.result {
                case .success(let data):()
                    let xml = XMLHash.parse(data!)["rss"]["channel"]["item"].all
                    var posts = [Post]()
                    for indexer in xml {
                        guard let titlePost = indexer["title"].element?.text,
                            let imageURL = indexer["media:content"].element?.attribute(by: "url")?.text,
                            let descriptionURL = indexer["link"].element?.text,
                            let description = indexer["description"].element?.text
                            else { continue }
                        posts.append(Post(title: titlePost, imageURL: imageURL, description: description, descriptionURL: descriptionURL))
                    }
                    completion(.success(posts))
                    
                case .failure(let error):
                    completion(.failure(error))
                }
        }
    }   
    
}
