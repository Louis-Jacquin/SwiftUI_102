//
//  PhotoView.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/24/24.
//

import SwiftUI

struct PhotoView: View {
    let photo: UnsplashPhoto
    @State var photoSize: Urls.CodingKeys = Urls.CodingKeys.regular
    
    var body: some View {
        VStack {
            Picker("PhotoSize", selection: $photoSize) {
                ForEach(Urls.CodingKeys.allCases, id: \.self) { size in
                    if (size != Urls.CodingKeys.raw && size != Urls.CodingKeys.thumb) {
                        Text(String(describing: size.rawValue).capitalized)
                    }
                }
            }.pickerStyle(.palette)
                
            AsyncImage(url: URL(string: photoSize.getResolution(urls: photo.urls))) { image in
                image.centerCropped()
            } placeholder: {
                ProgressView()
            }
            .frame(height: photoSize.getSize(urls: photo.urls))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }.navigationTitle("Une image de @\(photo.user.name)")
            .padding(10)
    }
}

//#Preview {
//    PhotoView()
//}
