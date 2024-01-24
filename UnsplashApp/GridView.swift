//
//  GridView.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/24/24.
//

import SwiftUI

struct GridView: View {
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var feedState: FeedState
    
    var body: some View {
        ScrollView {
            if let imageList = feedState.homeFeed {
                LazyVGrid(columns: columns) {
                    ForEach(imageList) { imageUrl in
                        NavigationLink {
                            PhotoView(photo: imageUrl)
                        } label: {
                            AsyncImage(url: URL(string: imageUrl.urls.raw)) { image in
                                image.centerCropped()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(height: 150)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                        }
                    }
                }
            } else {
                LazyVGrid(columns: columns) {
                    ForEach(1...12, id: \.self) { i in
                        RoundedRectangle(cornerRadius: 12)
                            .foregroundColor(Color.gray.opacity(0.3))
                            .frame(height: 150)
                    }
                }
                .redacted(reason: .placeholder)
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .padding(.horizontal, 10)
        .navigationTitle("Feed")
    }
}
