//
//  PersistanceController.swift
//  CoreDataMigration
//
//  Created by kitano hajime on 2022/04/19.
//

import Foundation
import CoreData

class PersistenceController {
    static let shared = PersistenceController()
    var viewCotext: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext

        let newPerson = PersonEntity(context: viewContext)
        newPerson.name = "Taku"

        let newClub = ClubEntity(context: viewContext)
        newClub.name = "Swimming"
        newClub.repesentitive = "Hajimel Phelps"
        newClub.addToMember(newPerson)

        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("\(nsError.userInfo)")
        }

        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreDataMigration")
        if inMemory {
            container.persistentStoreDescriptions.first?.url =
            URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError(error.localizedDescription)
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
}
