//
//  PostData.swift
//  SwiftUI News App
//
//  Created by Hassane Sidibe on 5/23/23.
//

import Foundation

struct Results: Decodable {
    let value: [Post]
}

struct Post: Decodable, Identifiable {
    var id: Int {
        Int.random(in: 1...987654)
    }
    let name: String
    let url: String
    let datePublished: String
}


