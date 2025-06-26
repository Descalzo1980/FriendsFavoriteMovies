//
//  SampleData.swift
//  FirendsFavoriteMovies
//
//  Created by Станислав Леонов on 26.06.2025.
//

import Foundation
import SwiftData

@MainActor
class SampleData {
    static let shared = SampleData()
    let modelConteiner: ModelContainer
    
    var context: ModelContext {
        modelConteiner.mainContext
    }
    
    private init() {
        let schema = Schema([
            Friend.self,
            Movie.self
        ])
        let modelConfoguration = ModelConfiguration(schema: schema,isStoredInMemoryOnly: true)
        
        do {
            modelConteiner = try ModelContainer(for: schema, configurations:[modelConfoguration])
            
            insertSampleData()
            
            try context.save()
            
        } catch {
            fatalError("Could not create ModelConteiner: \(error)")
        }
    }
    
    private func insertSampleData() {
        for friend in Friend.sampleData {
            context.insert(friend)
        }
        
        for movie in Movie.sampleData {
            context.insert(movie)
        }
    }
}
