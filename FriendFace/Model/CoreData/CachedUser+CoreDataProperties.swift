//
//  CachedUser+CoreDataProperties.swift
//  FriendFace
//
//  Created by Sara Diaz Perez on 24/5/22.
//
//

import Foundation
import CoreData


extension CachedUser {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }
    
    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var about: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var registered: String?
    @NSManaged public var cachedFriend: NSSet?
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown company"
    }
    
    public var wrappedAbout: String {
        about ?? "Unknown about"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown email"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown address"
    }
    
    public var wrappedRegistered: String {
        registered ?? "Unknown registered"
    }
    
    public var friendsArray: [CachedFriend] {
        let set = cachedFriend as? Set<CachedFriend> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }
    
    var registeredDate: Date {
        let isoDate = wrappedRegistered
        let dateFormatter = ISO8601DateFormatter()
        return dateFormatter.date(from: isoDate)!
    }
    
    var initials: String {
        let fullName = wrappedName.components(separatedBy: " ")
        let firstNameFull = fullName[0]
        let lastNameFull = fullName[1]
        
        let firstName = firstNameFull.first ?? Character(" ")
        let lastName = lastNameFull.first ?? Character(" ")
        return "\(firstName)\(lastName)".trimmingCharacters(in: .whitespaces)
    }
}

// MARK: Generated accessors for cachedFriend
extension CachedUser {
    
    @objc(addCachedFriendObject:)
    @NSManaged public func addToCachedFriend(_ value: CachedFriend)
    
    @objc(removeCachedFriendObject:)
    @NSManaged public func removeFromCachedFriend(_ value: CachedFriend)
    
    @objc(addCachedFriend:)
    @NSManaged public func addToCachedFriend(_ values: NSSet)
    
    @objc(removeCachedFriend:)
    @NSManaged public func removeFromCachedFriend(_ values: NSSet)
    
}

extension CachedUser : Identifiable {
    
}


