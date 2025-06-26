//
//  Friend.swift
//  FirendsFavoriteMovies
//
//  Created by Станислав Леонов on 26.06.2025.
//

import Foundation
import SwiftData


@Model
class Friend {
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Василий"),
        Friend(name: "Петр"),
        Friend(name: "Максим"),
        Friend(name: "Фёдор"),
        Friend(name: "Седьмой"),
    ]
}
