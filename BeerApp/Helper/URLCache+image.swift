//
//  URLCache+image.swift
//  BeerApp
//
//  Created by atme on 11/07/2022.
//

import Foundation

extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}
