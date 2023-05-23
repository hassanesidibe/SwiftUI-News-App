//
//  NetworkManager.swift
//  SwiftUI News App
//
//  Created by Hassane Sidibe on 5/23/23.
//

import Foundation

class NetWorkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        let headers = [
            "X-BingApis-SDK": "true",
            "X-RapidAPI-Key": "7247b016c3msh352229a87f8c353p17fdd1jsn97d55eddca0b",
            "X-RapidAPI-Host": "bing-news-search1.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://bing-news-search1.p.rapidapi.com/news?safeSearch=Off&textFormat=Raw")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                if let safeData = data {
                    let decoder = JSONDecoder()
                    let results = try! decoder.decode(Results.self, from: safeData)
                    DispatchQueue.main.async {
                        self.posts = results.value
//                        print(("Success updating UI"))
                    }
                }
                
            }
        })

        dataTask.resume()
    }
}
