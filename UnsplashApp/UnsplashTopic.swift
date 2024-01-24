//
//  UnsplashTopic.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/24/24.
//

import Foundation

struct UnsplashTopic: Codable, Identifiable {
    let id, slug, title, description, status: String
    let total_photos: Int
    let links: Links
    let cover_photo: UnsplashPhoto
}

struct Links: Codable {
    let it, html, photos: String

    enum CodingKeys: String, CodingKey {
        case it = "self"
        case html, photos
    }
}
