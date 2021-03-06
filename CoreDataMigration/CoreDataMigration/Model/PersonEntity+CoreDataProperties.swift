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

    public var _name: String {
        name ?? "Unknwon Name"
    }

    public var clubArray: [ClubEntity] {
        let set = club as? Set<ClubEntity> ?? []
        return set.sorted {
            $0._name < $1._name
        }
    }

    static var viewContext: NSManagedObjectContext {
        PersistenceController.shared.viewCotext
    }

    static func create() {
        let newPerson = PersonEntity(context: viewContext)
        newPerson.name = "Hajime"

        let newClub = ClubEntity(context: viewContext)
        newClub.name = "Swimming"
        newClub.repesentitive = "Hajime"

        newPerson.club = NSSet.init(array: [newClub])

    
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
