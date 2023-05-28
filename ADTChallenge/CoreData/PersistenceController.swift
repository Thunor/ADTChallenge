//
//  PersistenceController.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/28/23.
//

import Foundation
import CoreData

struct PersistenceController {
    // A singleton for our entire app to use
    static let shared = PersistenceController()

    // Storage for Core Data
    let container: NSPersistentContainer

    // A test configuration for SwiftUI previews
    static var preview: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 10 example programming languages.
        for index in 0..<10 {
            let episode = Episode(context: controller.container.viewContext)
            episode.id = Int16(index)
            episode.name = "Episode Name \(index)"
            episode.airDate = "5/\(index)/23"
            episode.episode = "S1E\(index)"
            episode.url = "https://rickandmortyapi.com/api/episode/\(index)"
            episode.created = "2017-11-10T12:56:33.798Z"
        }

        return controller
    }()

    // An initializer to load Core Data, optionally able
    // to use an in-memory store.
    init(inMemory: Bool = false) {
        // If you didn't name your model Main you'll need
        // to change this name below.
        container = NSPersistentContainer(name: "Main")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print("error: \(error)")
            }
        }
    }
}
