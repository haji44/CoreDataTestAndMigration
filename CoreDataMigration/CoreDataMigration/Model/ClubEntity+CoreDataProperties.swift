//
//  ClubEntity+CoreDataProperties.swift
//  CoreDataMigration
//
//  Created by kitano hajime on 2022/04/19.
//
//

import Foundation
import CoreData


extension ClubEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ClubEntity> {
        return NSFetchRequest<ClubEntity>(entityName: "ClubEntity")
    }

    @NSManaged public var name: String?
    @NSManaged public var repesentitive: String?
    @NSManaged public var member: NSSet?

    public var _name: String {
        name ?? "Unknown name"
    }
    public var _repesentitive: String {
        repesentitive ?? "Unknown name"
    }
    public var _member: [PersonEntity] {
        let set = member as? Set<PersonEntity> ?? []
        return set.sorted {
            $0._name < $1._name
        }
    }
}

// MARK: Generated accessors for member
extension ClubEntity {

    @objc(addMemberObject:)
    @NSManaged public func addToMember(_ value: PersonEntity)

    @objc(removeMemberObject:)
    @NSManaged public func removeFromMember(_ value: PersonEntity)

    @objc(addMember:)
    @NSManaged public func addToMember(_ values: NSSet)

    @objc(removeMember:)
    @NSManaged public func removeFromMember(_ values: NSSet)

}

extension ClubEntity : Identifiable {

}
