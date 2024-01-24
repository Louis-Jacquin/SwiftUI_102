//
//  FeedState.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/24/24.
//

import Foundation

enum Route: String {
    case PHOTOS = "/photos"
    case TOPICS = "/topics"
    case TOPICS_PHOTOS = ""
    
    func getRoute(id: String?) -> String {
        switch self {
            case .PHOTOS:
                self.rawValue
            case .TOPICS:
                self.rawValue
            case .TOPICS_PHOTOS:
            if let idTopic = id {
                Route.TOPICS.rawValue + "/\(idTopic)" + Route.PHOTOS.rawValue
            } else {
                fatalError()
            }
        }
    }
}

class FeedState: ObservableObject {
    @Published var homeFeed: [UnsplashPhoto]?
    @Published var homeTopics: [UnsplashTopic]?
    @Published var topicPhotos: [UnsplashPhoto]?

    // Fetch home feed doit utiliser la fonction feedUrl de UnsplashAPI
    // Puis assigner le résultat de l'appel réseau à la variable homeFeed
    func fetchHomeFeed(orderBy: String = "popular", perPage: Int = 10, path: Route = Route.PHOTOS, id: String? = nil) async {
        let url: URL? = UnsplashAPI.feedUrl(orderBy: orderBy, perPage: perPage, path: path.getRoute(id: id))
        
        if url != nil {
            do {
                // Créez une requête avec cette URL
                let request = URLRequest(url: url!)
                
                // Faites l'appel réseau
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Transformez les données en JSON
                let deserializedData = try JSONDecoder().decode([UnsplashPhoto].self, from: data)
                
                // Mettez à jour l'état de la vue
                await MainActor.run {
                    if (path == .PHOTOS) {
                        homeFeed = deserializedData
                    } else {
                        topicPhotos = deserializedData
                    }                    
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    func fetchHomeTopics(orderBy: String = "popular", perPage: Int = 10, path: String = "/topics") async {
        // Créez une URL avec la clé d'API
        let url: URL? = UnsplashAPI.feedUrl(orderBy: orderBy, perPage: perPage, path: path)
        
        if url != nil {
            do {
                // Créez une requête avec cette URL
                let request = URLRequest(url: url!)
                
                // Faites l'appel réseau
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Transformez les données en JSON
                let deserializedData = try JSONDecoder().decode([UnsplashTopic].self, from: data)

                // Mettez à jour l'état de la vue
                await MainActor.run {
                    homeTopics = deserializedData
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    func fetchHomeTopicsPhotos(orderBy: String = "popular", perPage: Int = 10, path: String = "/topics") async {
        // Créez une URL avec la clé d'API
        let url: URL? = UnsplashAPI.feedUrl(orderBy: orderBy, perPage: perPage, path: path)
        
        if url != nil {
            do {
                // Créez une requête avec cette URL
                let request = URLRequest(url: url!)
                
                // Faites l'appel réseau
                let (data, _) = try await URLSession.shared.data(for: request)
                
                // Transformez les données en JSON
                let deserializedData = try JSONDecoder().decode([UnsplashTopic].self, from: data)

                // Mettez à jour l'état de la vue
                await MainActor.run {
                    homeTopics = deserializedData
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
