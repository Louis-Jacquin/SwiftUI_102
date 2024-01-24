//
//  UnsplashPhoto.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/23/24.
//

import Foundation

struct UnsplashPhoto: Codable, Identifiable {
    let id, slug: String
    let urls: Urls
    let user: User
}

struct Urls: Codable {
    let raw, full, regular, small, thumb: String
    
    enum CodingKeys: String, CodingKey, CaseIterable {
        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
        
        func getResolution(urls: Urls) -> String {
            switch self {
                case .raw:
                    urls.raw
                case .full:
                    urls.full
                case .regular:
                    urls.regular
                case .small:
                    urls.small
                case .thumb:
                    urls.thumb
            }
        }
        
        func getSize(urls: Urls) -> CGFloat {
            switch self {
                case .raw:
                    400
                case .full:
                    300
                case .regular:
                    200
                case .small:
                    100
                case .thumb:
                    50
            }
        }
    }
}

struct User: Codable {
    let name: String
}
