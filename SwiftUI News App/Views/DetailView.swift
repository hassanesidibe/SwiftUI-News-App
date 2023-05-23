//
//  DetailView.swift
//  SwiftUI News App
//
//  Created by Hassane Sidibe on 5/23/23.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://github.com/hassanesidibe/NewsApp")
    }
}
