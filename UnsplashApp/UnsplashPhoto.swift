//
//  UnsplashPhoto.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/23/24.
//

import Foundation

struct UnsplashPhoto: Codable {
    let id, slug: String
    let urls: Urls
    let user: User
}

struct Urls: Codable {
    let raw, full, regular, small, thumb: String
}

struct User: Codable {
    let name: String
}
