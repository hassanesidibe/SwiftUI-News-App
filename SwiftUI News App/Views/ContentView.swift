//
//  ContentView.swift
//  SwiftUI News App
//
//  Created by Hassane Sidibe on 5/23/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var newsmanager = NetWorkManager()
    let demoArticle: [Post] = [
        Post(name: "The first human to land on mars", url: "https://mars.nasa.gov/mars2020/", datePublished: "2023-12-14"),
        Post(name: "Meet the only man alive who has been to the deepest ocean", url: "https://www.bbc.com/news/av/science-environment-17060355", datePublished: "1960-07-23"),
        Post(name: "Ukraine war: Wagner chief vows to hand Bakhmut to Russian army by June", url: "https://www.bbc.com/news/world-europe-65670534", datePublished: "2022-09-21"),
        Post(name: "F-16 fighter jets: Biden to let allies supply warplanes in major boost for Kyiv", url: "https://www.bbc.com/news/world-us-canada-65649471", datePublished: "2023-07-21"),
        Post(name: "Meet the only man alive who has been to the deepest ocean", url: "https://www.bbc.com/news/av/science-environment-17060355", datePublished: "1960-07-23"),
        Post(name: "Ukraine war: Wagner chief vows to hand Bakhmut to Russian army by June", url: "https://www.bbc.com/news/world-europe-65670534", datePublished: "2022-09-21")
    ]
    
    var body: some View {
        
        NavigationView {
            List {
                ForEach(newsmanager.posts) {post in
//                ForEach(self.demoArticle) {post in
                    NavigationLink(destination: WebView(urlString: post.url)) {
                        Text("\(post.name)")
                            .bold()
                    }
                }
            }
            .navigationTitle("Global News")
            .onAppear { newsmanager.fetchData() }
        }
    }
    
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
