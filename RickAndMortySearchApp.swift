//
//  RickAndMortySearchApp.swift
//  RickAndMortySearch
//
//  Created by Eduardo Geovanni Pérez Munguía on 03/05/26.
//

import SwiftUI
import CoreData

@main
struct RickAndMortySearchApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
