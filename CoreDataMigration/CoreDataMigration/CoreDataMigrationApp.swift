//
//  CoreDataMigrationApp.swift
//  CoreDataMigration
//
//  Created by kitano hajime on 2022/04/19.
//

import SwiftUI

@main
struct CoreDataMigrationApp: App {
    let persistance = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView().environment(\.managedObjectContext, persistance.viewCotext)
        }
    }
}
