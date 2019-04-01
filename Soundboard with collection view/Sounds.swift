//
//  Sounds.swift
//  Soundboard with collection view
//
//  Created by Alexander Niehaus on 3/31/19.
//  Copyright © 2019 AlexanderNiehaus. All rights reserved.
//

import Foundation

struct Sounds{
    var statement : String
    var fileName : String
    var filePath : URL? {
        return Bundle.main.url(forResource: fileName, withExtension: "aifc")
    }
}
