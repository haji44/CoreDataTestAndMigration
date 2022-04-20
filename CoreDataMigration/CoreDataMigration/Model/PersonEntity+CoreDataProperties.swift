//
//  PersonEntity+CoreDataProperties.swift
//  CoreDataMigration
//
//  Created by kitano hajime on 2022/04/19.
//
//

import Foundation
import CoreData


extension PersonEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PersonEntity> {
        return NSFetchRequest<PersonEntity>(entityName: "PersonEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var club: NSSet?

    static var viewContext: NSManagedObjectContext {
        PersistenceController.shared.viewCotext
    }

    static func create() {
        let newPerson = PersonEntity(context: viewContext)
        newPerson.name = "Hajime"
        save()
    }

    static func save() {
        do {
            try viewContext.save()
        } catch let error {
            fatalError("\(error.localizedDescription)")
        }
    }

}

// MARK: Generated accessors for club
extension PersonEntity {

    @objc(addClubObject:)
    @NSManaged public func addToClub(_ value: ClubEntity)

    @objc(removeClubObject:)
    @NSManaged public func removeFromClub(_ value: ClubEntity)

    @objc(addClub:)
    @NSManaged public func addToClub(_ values: NSSet)

    @objc(removeClub:)
    @NSManaged public func removeFromClub(_ values: NSSet)

}

extension PersonEntity : Identifiable {

}
