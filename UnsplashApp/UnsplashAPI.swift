//
//  UnsplashAPI.swift
//  UnsplashApp
//
//  Created by Louis JACQUIN on 1/24/24.
//

import Foundation

struct UnsplashAPI {
    static func unsplashApiBaseUrl() -> URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.unsplash.com"
        urlComponents.queryItems = [URLQueryItem(name: "client_id", value: ConfigurationManager.instance.plistDictionnary.clientId)]
        
        return urlComponents
    }
    
    static func feedUrl(orderBy: String = "popular", perPage: Int = 10, path: String = "/photos") -> URL? {
        var component = unsplashApiBaseUrl()
        let queryItems = [
            URLQueryItem(name: "per_page", value: String(perPage)),
            URLQueryItem(name: "order_by", value: orderBy)
        ]
        component.queryItems?.append(contentsOf: queryItems)
        component.path = path
        
        return component.url
    }
}
