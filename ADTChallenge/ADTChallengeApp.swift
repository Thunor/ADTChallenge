//
//  ADTChallengeApp.swift
//  ADTChallenge
//
//  Created by Eric Freitas on 5/26/23.
//

import SwiftUI

@main
struct ADTChallengeApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
