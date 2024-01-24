//
//  ContentView.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/23/24.
//

import SwiftUI

struct ContentView: View {
      
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    @State var imageList: [UnsplashPhoto] = []
    
    @StateObject var feedState = FeedState()
    
    var body: some View {
        NavigationStack {
            // le bouton va lancer l'appel réseau
            Button(action: {
                Task {
                    await feedState.fetchHomeFeed()
                    await feedState.fetchHomeTopics()
                }
            }, label: {
                Text("Load Data")
            })
            ScrollView(.horizontal) {
                if let topicsList = feedState.homeTopics {
                    LazyHGrid(rows: [GridItem(.flexible())], content: {
                        ForEach(topicsList) { topic in
                            NavigationLink {
                                TopicView(topic: topic)
                                    .onAppear(perform: {
                                        feedState.topicPhotos = []
                                    })
                            } label: {
                                VStack {
                                    AsyncImage(url: URL(string: topic.cover_photo.urls.raw)) { image in
                                        image.centerCropped()
                                    } placeholder: {
                                        ProgressView()
                                    }
                                    .frame(width: 200, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    Text(topic.title)
                                }
                            }
                        }
                    })
                }
            }
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .padding(.horizontal, 10)
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
        }.environmentObject(feedState)
    }
}



// On étend notre fonction sur Image, pour pouvoir l'utiliser sur une Image
extension Image {
    // On créer un fonction "centerCropped()"
    func centerCropped() -> some View {
        // On créer un objet GeometryReader pour accéder à des propriétés comme la taille de l'écran
        GeometryReader { geo in
            // On utilise l'image actuelle
            self
            // On rend l'image resizable() pour qu'elle puisse changer de taille
            .resizable()
            // On garde les proportions de l'image pour éviter le déformement
            .scaledToFill()
            // On change la taille de l'image
            .frame(width: geo.size.width, height: geo.size.height)
            // On recadre l'image
            .clipped()
        }
    }
}

#Preview {
    ContentView()
}
